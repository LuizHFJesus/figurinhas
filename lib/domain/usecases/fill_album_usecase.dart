import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class FillAlbumUseCase {
  final StickerStateRepository _stickerRepository;
  final StatsRepository _statsRepository;
  final CatalogRepository _catalogRepository;

  FillAlbumUseCase(
    this._stickerRepository,
    this._statsRepository,
    this._catalogRepository,
  );

  Future<void> call({
    required String userAlbumId,
    required String albumId,
  }) async {
    final stickers = await _catalogRepository.getAllStickers(albumId);
    final allCodes = stickers.map((s) => s.code).toList(growable: false);

    await _stickerRepository.fillUserAlbumStates(userAlbumId, allCodes);
    await _statsRepository.fillUserAlbumStats(userAlbumId);
  }
}
