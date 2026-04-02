import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetAllSectionsUseCase {
  final CatalogRepository _repo;

  GetAllSectionsUseCase(this._repo);

  Future<List<Section>> call(String albumId) {
    return _repo.getAllSections(albumId);
  }
}
