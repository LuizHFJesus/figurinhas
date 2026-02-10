import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetAllStickersUseCase {
  final CatalogRepository _repo;

  GetAllStickersUseCase(this._repo);

  Future<List<Sticker>> call(String albumId) {
    return _repo.getAllStickers(albumId);
  }
}
