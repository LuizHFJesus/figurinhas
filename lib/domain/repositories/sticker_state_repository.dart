import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';

abstract class StickerStateRepository {
  Future<StickerState?> getState({
    required String userAlbumId,
    required String code,
  });

  Future<void> setQuantity({
    required String userAlbumId,
    required String code,
    required int quantity,
  });

  /// Bulk load for smooth UI
  Future<Map<String, int>> getAllQuantitiesForUserAlbum(String userAlbumId);

  Stream<List<StickerState>> watchAllStatesForUserAlbum(String userAlbumId);
}
