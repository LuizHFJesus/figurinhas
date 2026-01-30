import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class SearchSectionsUseCase {
  final CatalogRepository _repo;

  SearchSectionsUseCase(this._repo);

  Future<List<String>> call({
    required String albumId,
    required String query,
    int limit = 50,
  }) => _repo.searchSectionIds(albumId: albumId, query: query, limit: limit);
}
