import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetAlbumGroupsUseCase {
  final CatalogRepository _repo;

  GetAlbumGroupsUseCase(this._repo);

  Future<List<Group>> call(String albumId) => _repo.getGroups(albumId);
}
