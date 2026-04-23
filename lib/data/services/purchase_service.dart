import 'dart:async';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class PurchaseService extends GetxService {
  final UserProfileRepository _profileRepo;
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  static const String removeAdsId = 'remove_ads';

  final RxBool adsRemoved = false.obs;

  PurchaseService(this._profileRepo);

  @override
  void onInit() {
    super.onInit();
    final purchaseUpdated = _iap.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: () => _subscription.cancel(),
      onError: (error) {
        // Handle error
      },
    );
    _initAdsRemoved();
  }

  Future<void> _initAdsRemoved() async {
    final profileId = await _profileRepo.ensureLocalProfileId();
    adsRemoved.value = await _profileRepo.isAdsRemoved(profileId);
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  Future<void> _onPurchaseUpdate(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (final purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Show pending UI if needed
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // Handle error
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          if (purchaseDetails.productID == removeAdsId) {
            await _setAdsRemoved(true);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _iap.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> _setAdsRemoved(bool value) async {
    final profileId = await _profileRepo.ensureLocalProfileId();
    await _profileRepo.setAdsRemoved(profileId, value: value);
    adsRemoved.value = value;
  }

  Future<void> buyRemoveAds() async {
    final available = await _iap.isAvailable();
    if (!available) return;

    const kIds = <String>{removeAdsId};
    final response = await _iap.queryProductDetails(kIds);

    if (response.notFoundIDs.isNotEmpty) {
      // Handle not found
      return;
    }

    final productDetails = response.productDetails.first;
    final purchaseParam = PurchaseParam(productDetails: productDetails);
    await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async => _iap.restorePurchases();
}
