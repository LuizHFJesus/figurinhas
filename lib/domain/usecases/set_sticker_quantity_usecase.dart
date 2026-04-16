import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class SetStickerQuantityUseCase {
  final StickerStateRepository _states;
  final IsarStatsUpdater _statsUpdater;

  SetStickerQuantityUseCase(this._states, this._statsUpdater);

  Future<void> call({
    required String userAlbumId,
    required String albumId,
    required String code,
    required int quantity,
  }) async {
    if (quantity < 0) {
      throw ArgumentError.value(quantity, 'quantity', 'must be >= 0');
    }

    final prev = await _states.getState(userAlbumId: userAlbumId, code: code);
    final oldQty = prev?.quantity ?? 0;

    if (oldQty == quantity) return;

    await _states.setQuantity(
      userAlbumId: userAlbumId,
      code: code,
      quantity: quantity,
    );

    await _statsUpdater.applyStickerQuantityChange(
      userAlbumId: userAlbumId,
      albumId: albumId,
      code: code,
      oldQty: oldQty,
      newQty: quantity,
    );
  }
}
