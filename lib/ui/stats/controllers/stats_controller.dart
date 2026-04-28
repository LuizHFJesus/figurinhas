import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';
import 'package:sticker_manager_wc22/ui/stats/models/stats_route_args.dart';

class StatsController extends GetxController {
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchAlbumStatsUseCase _watchAlbumStats;
  final ShareCoordinator _shareCoordinator;
  final MoreOptionsCoordinator _moreOptionsCoordinator;
  final ActiveAlbumService _activeAlbumService;

  final StatsRouteArgs? args;

  Rx<UserAlbum?> get album => _activeAlbumService.activeAlbum;
  Rx<AlbumStats?> get stats => _activeAlbumService.albumStats;

  StatsController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats,
    this._shareCoordinator,
    this._moreOptionsCoordinator,
    this._activeAlbumService, {
    required this.args,
  });

  @override
  Future<void> onInit() async {
    super.onInit();

    if (args?.album != null && album.value == null) {
      _activeAlbumService.setActiveAlbum(args!.album!);
    }

    if (args?.stats != null && stats.value == null) {
      stats.value = args!.stats;
    }

    await _loadData();
  }

  Future<void> showMoreOptions(BuildContext context) async {
    final currentAlbum = album.value;
    if (currentAlbum == null) return;
    await _moreOptionsCoordinator.showMoreOptions(context, currentAlbum);
  }

  Future<void> showShareOptions(BuildContext context) async {
    final currentAlbum = album.value;
    if (currentAlbum == null) return;
    await _shareCoordinator.showShareOptions(context, currentAlbum);
  }

  Future<void> _loadData() async {
    if (album.value == null) {
      final profileId = await _profileRepo.ensureLocalProfileId();
      final currentAlbum = await _getActiveAlbum(profileId);
      if (currentAlbum != null) {
        _activeAlbumService.setActiveAlbum(currentAlbum);
      }
    }
  }
}
