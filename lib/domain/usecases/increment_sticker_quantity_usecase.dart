import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class IncrementStickerQuantityUseCase {
  final StickerStateRepository _states;
  final IsarStatsUpdater _statsUpdater;

  IncrementStickerQuantityUseCase(this._states, this._statsUpdater);

  Future<void> call({
    required String userAlbumId,
    required String albumId,
    required String code,
    int delta = 1,
  }) async {
    if (delta == 0) return;

    final prev = await _states.getState(userAlbumId: userAlbumId, code: code);
    final oldQty = prev?.quantity ?? 0;

    final newQty = oldQty + delta;
    final clamped = newQty < 0 ? 0 : newQty;

    if (oldQty == clamped) return;

    await _states.setQuantity(
      userAlbumId: userAlbumId,
      code: code,
      quantity: clamped,
    );

    await _statsUpdater.applyStickerQuantityChange(
      userAlbumId: userAlbumId,
      albumId: albumId,
      code: code,
      oldQty: oldQty,
      newQty: clamped,
    );
  }
}
