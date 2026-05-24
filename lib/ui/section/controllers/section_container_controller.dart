import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';

class SectionContainerController extends GetxController {
  final UserProfileRepository _profileRepo;
  final CatalogRepository _catalogRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;

  final String initialSectionId;
  final SectionRouteArgs? sectionArgs;

  final RxList<Section> sections = <Section>[].obs;
  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final RxInt currentIndex = 0.obs;

  late PageController pageController;

  SectionContainerController(
    this._profileRepo,
    this._catalogRepo,
    this._getActiveAlbum, {
    required this.initialSectionId,
    required this.sectionArgs,
  });

  @override
  void onInit() {
    super.onInit();
    activeAlbum.value = sectionArgs?.album;

    if (sectionArgs?.allSections != null) {
      sections.assignAll(sectionArgs!.allSections!);
    }

    // Initialize PageController synchronously to avoid LateInitializationError
    // during the first build, even if sections are empty.
    final initialIndex = sections.indexWhere(
      (s) => s.sectionId == initialSectionId,
    );
    currentIndex.value = initialIndex >= 0 ? initialIndex : 0;
    pageController = PageController(initialPage: currentIndex.value);

    _loadData();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> _loadData() async {
    if (activeAlbum.value == null) {
      final profileId = await _profileRepo.ensureLocalProfileId();
      activeAlbum.value = await _getActiveAlbum(profileId);
    }

    if (sections.isEmpty && activeAlbum.value != null) {
      final allSections = await _catalogRepo.getAllSections(
        activeAlbum.value!.albumId,
      );

      final initialIndex = allSections.indexWhere(
        (s) => s.sectionId == initialSectionId,
      );
      currentIndex.value = initialIndex >= 0 ? initialIndex : 0;

      // Initialize PageController with the correct initial index if it changed
      if (currentIndex.value != 0) {
        pageController.dispose();
        pageController = PageController(initialPage: currentIndex.value);
      }

      sections.assignAll(allSections);
    }
  }

  void onPageChanged(int index) => currentIndex.value = index;

  void goToPrevious() {
    if (currentIndex.value > 0) {
      pageController.animateToPage(
        currentIndex.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToNext() {
    if (currentIndex.value < sections.length - 1) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
