import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetStickersBySectionUseCase {
  final CatalogRepository _repo;

  GetStickersBySectionUseCase(this._repo);

  Future<List<Sticker>> call({
    required String albumId,
    required String sectionId,
  }) {
    return _repo.getStickersBySection(albumId: albumId, sectionId: sectionId);
  }
}
