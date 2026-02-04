import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetSectionsByGroupUseCase {
  final CatalogRepository _repo;

  GetSectionsByGroupUseCase(this._repo);

  Future<List<Section>> call({
    required String albumId,
    required String groupId,
  }) => _repo.getSectionsByGroup(albumId: albumId, groupId: groupId);
}
