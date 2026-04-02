import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/ads/usecases/load_banner_ad_usecase.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';
import 'package:sticker_manager_wc22/ui/stats/models/stats_route_args.dart';

class StatsController extends GetxController {
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchAlbumStatsUseCase _watchAlbumStats;
  final LoadBannerAdUseCase _loadBannerUseCase;
  final ShareCoordinator _shareCoordinator;

  final StatsRouteArgs? args;

  final Rx<UserAlbum?> album = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> stats = Rx<AlbumStats?>(null);

  // Ad
  RxBool get isBannerReady => _loadBannerUseCase.isBannerReady;
  BannerAd? get bannerAd => _loadBannerUseCase.bannerAd;

  StatsController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats,
    this._loadBannerUseCase,
    this._shareCoordinator, {
    required this.args,
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    album.value = args?.album;
    stats.value = args?.stats;
    await _loadStats();
  }

  @override
  void onClose() {
    _loadBannerUseCase.dispose();
    super.onClose();
  }

  Future<void> showShareOptions(BuildContext context) async {
    if (album.value == null) return;
    await _shareCoordinator.showShareOptions(context, album.value!);
  }

  Future<void> _loadStats() async {
    final profileId =
        args?.album?.profileId ?? await _profileRepo.ensureLocalProfileId();

    final currentAlbum = album.value ?? await _getActiveAlbum(profileId);
    album.value = currentAlbum;

    _watchAlbumStats
        .watch(
          userAlbumId: currentAlbum.userAlbumId,
          albumId: currentAlbum.albumId,
        )
        .listen((s) => stats.value = s);

    await _loadBannerUseCase.call(adUnitId: AdUnitIds.statsBanner);
  }
}
