import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';

class ActiveAlbumService extends GetxService {
  final WatchAlbumStatsUseCase _watchAlbumStats;
  final StickerStateRepository _stateRepository;

  ActiveAlbumService(this._watchAlbumStats, this._stateRepository);

  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> albumStats = Rx<AlbumStats?>(null);

  // Sticker States
  final StickerQtyStore qtyStore = StickerQtyStore();
  StreamSubscription<List<StickerState>>? _stickersState;

  int quantityOf(String code) => qtyStore.get(code);

  ValueListenable<int> listenableOf(String code) => qtyStore.listenableOf(code);

  @override
  void onClose() {
    unawaited(_stickersState?.cancel());
    qtyStore.dispose();
    super.onClose();
  }

  void setActiveAlbum(UserAlbum album) {
    activeAlbum.value = album;
    _watchStats(album);
    unawaited(_watchStickers(album));
  }

  void _watchStats(UserAlbum album) {
    _watchAlbumStats
        .watch(userAlbumId: album.userAlbumId, albumId: album.albumId)
        .listen((stats) {
          albumStats.value = stats;
        });
  }

  Future<void> _watchStickers(UserAlbum album) async {
    // Initial Load
    final initialQuantities = await _stateRepository
        .getAllQuantitiesForUserAlbum(album.userAlbumId);

    qtyStore.resetOthers(initialQuantities.keys.toSet());
    for (final e in initialQuantities.entries) {
      qtyStore.set(e.key, e.value);
    }

    // Watch for updates
    await _stickersState?.cancel();
    _stickersState = _stateRepository
        .watchAllStatesForUserAlbum(album.userAlbumId)
        .listen((states) {
          final activeCodes = <String>{};
          for (final s in states) {
            activeCodes.add(s.code);
            qtyStore.set(s.code, s.quantity);
          }
          qtyStore.resetOthers(activeCodes);
        });
  }
}
