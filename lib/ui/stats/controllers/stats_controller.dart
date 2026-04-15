import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final StatsRouteArgs? args;

  final Rx<UserAlbum?> album = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> stats = Rx<AlbumStats?>(null);

  StatsController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats,
    this._shareCoordinator,
    this._moreOptionsCoordinator, {
    required this.args,
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    album.value = args?.album;
    stats.value = args?.stats;
    await _loadStats();
  }

  Future<void> showMoreOptions(BuildContext context) async {
    if (album.value == null) return;
    await _moreOptionsCoordinator.showMoreOptions(context, album.value!);
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
  }
}
