import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class GetAllSectionsUseCase {
  final CatalogRepository _repo;

  GetAllSectionsUseCase(this._repo);

  Future<List<Section>> call(String albumId) async {
    final groups = await _repo.getGroups(albumId);
    final results = await Future.wait(
      groups.map(
        (g) => _repo.getSectionsByGroup(
          albumId: albumId,
          groupId: g.groupId,
        ),
      ),
    );

    final allSections = <Section>[];
    results.forEach(allSections.addAll);
    return allSections;
  }
}
