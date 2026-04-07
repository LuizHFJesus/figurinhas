import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_state_entity.dart';
import 'package:sticker_manager_wc22/data/mappers/entity_mappers.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class StickerStateRepositoryImpl implements StickerStateRepository {
  final UserLocalDataSource _local;

  StickerStateRepositoryImpl(this._local);

  static String _stateId(String userAlbumId, String code) =>
      '$userAlbumId:$code';

  @override
  Future<StickerState?> getState({
    required String userAlbumId,
    required String code,
  }) async {
    final e = await _local.getStickerState(_stateId(userAlbumId, code));
    return e == null ? null : EntityMappers.toStickerState(e);
  }

  @override
  Future<void> setQuantity({
    required String userAlbumId,
    required String code,
    required int quantity,
  }) async {
    if (quantity < 0) {
      throw ArgumentError.value(quantity, 'quantity', 'must be >= 0');
    }

    final now = DateTime.now();
    final id = _stateId(userAlbumId, code);
    final existing = await _local.getStickerState(id);

    final sticker =
        existing ??
        (StickerStateEntity()
          ..stateId = id
          ..userAlbumId = userAlbumId
          ..code = code
          ..wanted = false
          ..forTrade = false);

    sticker
      ..quantity = quantity
      ..updatedAt = now
      ..deletedAt = null;

    await _local.upsertStickerState(sticker);
  }

  @override
  Future<Map<String, int>> getAllQuantitiesForUserAlbum(
    String userAlbumId,
  ) async {
    final list = await _local.getAllStickerStates(userAlbumId);
    final map = <String, int>{};
    for (final e in list) {
      map[e.code] = e.quantity;
    }
    return map;
  }

  @override
  Stream<List<StickerState>> watchAllStatesForUserAlbum(String userAlbumId) {
    return _local.watchAllStickerStates(userAlbumId).map((list) {
      return list.map(EntityMappers.toStickerState).toList(growable: false);
    });
  }

  @override
  Future<void> clearUserAlbumStates(String userAlbumId) async {
    await _local.deleteAllStickerStates(userAlbumId);
  }

  @override
  Future<void> fillUserAlbumStates(String userAlbumId, List<String> allCodes) async {
    await _local.fillAllStickerStates(userAlbumId, allCodes);
  }
}
