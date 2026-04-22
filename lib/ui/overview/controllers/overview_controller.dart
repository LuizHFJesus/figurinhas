import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/utils/text_normalizer.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_stickers_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/search_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/sticker_quantity_dialog.dart';
import 'package:sticker_manager_wc22/ui/overview/models/overview_view_model.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';

class OverviewController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final GetAllSectionsUseCase _getAllSections;
  final GetAllStickersUseCase _getAllStickers;
  final MoreOptionsCoordinator _moreOptionsCoordinator;
  final SearchSectionsUseCase _searchSections;
  final IncrementStickerQuantityUseCase _incrementSticker;
  final SetStickerQuantityUseCase _setStickerQuantity;
  final HasSeenHowItWorksUseCase _hasSeenHowItWorks;
  final SetHasSeenHowItWorksUseCase _setHasSeenHowItWorks;
  final ShareCoordinator _shareCoordinator;
  final ActiveAlbumService _activeAlbumService;

  // State
  final RxBool isLoading = true.obs;
  final RxBool isSearching = false.obs;

  Rx<UserAlbum?> get activeAlbum => _activeAlbumService.activeAlbum;

  Rx<AlbumStats?> get albumStats => _activeAlbumService.albumStats;

  // Filters
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final Rx<StickerFilter> currentFilter = StickerFilter.all.obs;

  // Scroll & UI
  final ScrollController scrollController = ScrollController();
  final RxBool isSearchMinimized = false.obs;
  final RxBool showScrollToTop = false.obs;

  // Raw data (stable)
  final List<Section> _allSections = [];
  final List<Sticker> _allStickers = [];
  final Map<String, List<Sticker>> _stickersBySection = {};

  StickerQtyStore get qtyStore => _activeAlbumService.qtyStore;
  final FocusNode searchFocus = FocusNode();

  // Output
  final RxList<OverviewSection> visibleSections = <OverviewSection>[].obs;

  OverviewController(
    this._profileRepo,
    this._getActiveAlbum,
    this._getAllSections,
    this._getAllStickers,
    this._moreOptionsCoordinator,
    this._searchSections,
    this._incrementSticker,
    this._setStickerQuantity,
    this._hasSeenHowItWorks,
    this._setHasSeenHowItWorks,
    this._shareCoordinator,
    this._activeAlbumService,
  );

  @override
  Future<void> onInit() async {
    super.onInit();

    debounce(
      searchQuery,
      (_) => _rebuildVisibleSections(),
    );

    ever(currentFilter, (_) => _rebuildVisibleSections());

    scrollController.addListener(_onScroll);

    await _loadData();
  }

  @override
  Future<void> onClose() async {
    searchController.dispose();
    searchFocus.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    final offset = scrollController.offset;
    final showFab = offset > 500;

    if (showScrollToTop.value != showFab) showScrollToTop.value = showFab;

    if (searchQuery.isNotEmpty || offset <= 0) {
      if (isSearchMinimized.value) isSearchMinimized.value = false;
      return;
    }

    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      if (!isSearchMinimized.value) isSearchMinimized.value = true;
    }
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;

      if (activeAlbum.value == null) {
        final profileId = await _profileRepo.ensureLocalProfileId();
        final album = await _getActiveAlbum(profileId);
        _activeAlbumService.setActiveAlbum(album);
      }
      final album = activeAlbum.value!;

      final results = await Future.wait([
        _getAllSections(album.albumId),
        _getAllStickers(album.albumId),
      ]);

      _allSections
        ..clear()
        ..addAll(results[0] as List<Section>);

      _allStickers
        ..clear()
        ..addAll(results[1] as List<Sticker>);

      _buildSectionIndex();

      await _rebuildVisibleSections();
    } finally {
      isLoading.value = false;
    }
  }

  void _buildSectionIndex() {
    _stickersBySection.clear();
    for (final s in _allSections) {
      _stickersBySection[s.sectionId] = <Sticker>[];
    }
    for (final st in _allStickers) {
      (_stickersBySection[st.sectionId] ??= <Sticker>[]).add(st);
    }
  }

  // Filtering core

  bool _matchesFilter(int qty) {
    return switch (currentFilter.value) {
      StickerFilter.all => true,
      StickerFilter.obtained => qty > 0,
      StickerFilter.missing => qty == 0,
      StickerFilter.repeated => qty > 1,
    };
  }

  bool _matchesQuery({
    required String normalizedQuery,
    required Section section,
    required Sticker sticker,
  }) {
    if (normalizedQuery.isEmpty) return true;

    final matchCode = sticker.code.toLowerCase().contains(normalizedQuery);
    final matchName = TextNormalizer.normalize(
      sticker.displayName,
    ).contains(normalizedQuery);
    final matchSection = TextNormalizer.normalize(
      section.name,
    ).contains(normalizedQuery);

    return matchCode || matchName || matchSection;
  }

  Future<void> _rebuildVisibleSections() async {
    final album = activeAlbum.value;
    if (album == null) return;

    final query = searchQuery.value.trim();
    final normalizedQuery = TextNormalizer.normalize(query);

    Set<String>? allowedSectionIds;
    if (query.isNotEmpty) {
      final ids = await _searchSections(albumId: album.albumId, query: query);
      allowedSectionIds = ids.toSet();
    }

    final result = <OverviewSection>[];

    for (final section in _allSections) {
      if (allowedSectionIds != null &&
          !allowedSectionIds.contains(section.sectionId)) {
        continue;
      }

      final stickers =
          _stickersBySection[section.sectionId] ?? const <Sticker>[];

      final visible = <Sticker>[];
      for (final st in stickers) {
        final qty = _activeAlbumService.quantityOf(st.code);

        if (!_matchesFilter(qty)) continue;
        // if (!_matchesQuery(
        //   normalizedQuery: normalizedQuery,
        //   section: section,
        //   sticker: st,
        // )) {
        //   continue;
        // }

        visible.add(st);
      }

      if (visible.isNotEmpty) {
        result.add(OverviewSection(section: section, visibleStickers: visible));
      }
    }

    visibleSections.assignAll(result);
  }

  // Actions

  void focusSearch() {
    isSearchMinimized.value = false;
    searchFocus.requestFocus();
  }

  Future<void> updateSearch(String value) async {
    searchQuery.value = value;
    if (value.isNotEmpty) isSearchMinimized.value = false;
  }

  Future<void> cleanSearch() async {
    searchController.clear();
    await updateSearch('');
  }

  Future<void> setFilter(StickerFilter filter) async {
    if (currentFilter.value == filter) return;
    currentFilter.value = filter;
    await _rebuildVisibleSections();
  }

  Future<void> onStickerTap(BuildContext context, Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    final profileId = await _profileRepo.ensureLocalProfileId();
    final hasSeen = await _hasSeenHowItWorks(profileId);

    if (!hasSeen) {
      if (context.mounted) {
        await _moreOptionsCoordinator.showHowItWorks(context);
        await _setHasSeenHowItWorks(profileId, true);
      }
    }

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
    );
  }

  Future<void> onStickerLongPress(BuildContext context, Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    final current = _activeAlbumService.quantityOf(sticker.code);
    if (current <= 0) return;

    if (current >= 3) {
      final newQty = await showDialog<int?>(
        context: context,
        builder: (context) => StickerQuantityDialog(
          sticker: sticker,
          initialQuantity: current,
        ),
      );

      if (newQty != null && newQty != current) {
        await _setStickerQuantity(
          userAlbumId: album.userAlbumId,
          albumId: album.albumId,
          code: sticker.code,
          quantity: newQty,
        );
      }
      return;
    }

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
      delta: -1,
    );
  }

  Future<void> showShareOptions(BuildContext context) async {
    if (activeAlbum.value == null) return;
    await _shareCoordinator.showShareOptions(context, activeAlbum.value!);
  }

  Future<void> showMoreOptions(BuildContext context) async {
    if (activeAlbum.value == null) return;
    await _moreOptionsCoordinator.showMoreOptions(context, activeAlbum.value!);
  }

  Future<void> scrollToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    isSearchMinimized.value = false;
  }
}
