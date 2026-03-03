import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';

class LoadBannerAdUseCase {
  final RxBool isBannerReady = false.obs;
  BannerAd? bannerAd;

  Future<void> call({required String adUnitId}) async {
    isBannerReady.value = false;
    bannerAd = await _loadBanner(
      adUnitId: adUnitId,
      onLoaded: () => isBannerReady.value = true,
      onFailed: () => isBannerReady.value = false,
    );
  }

  void dispose() => bannerAd?.dispose();

  Future<BannerAd?> _loadBanner({
    required String adUnitId,
    required VoidCallback onLoaded,
    required VoidCallback onFailed,
  }) async {
    final banner = BannerAd(
      size: AdSize.banner,
      adUnitId: kDebugMode ? AdUnitIds.androidTestBanner : adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => onLoaded(),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          onFailed();
        },
      ),
    );

    await banner.load();
    return banner;
  }
}
