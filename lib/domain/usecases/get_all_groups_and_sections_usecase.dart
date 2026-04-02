import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/ui/home/models/group_sections.dart';

class GetAllGroupsAndSectionsUseCase {
  final CatalogRepository _repo;

  GetAllGroupsAndSectionsUseCase(this._repo);

  Future<List<GroupSections>> call(String albumId) async {
    final groups = await _repo.getGroups(albumId);
    final allSections = await _repo.getAllSections(albumId);

    final sectionsByGroupId = <String, List<Section>>{};
    for (final section in allSections) {
      (sectionsByGroupId[section.groupId] ??= []).add(section);
    }

    return groups.map((group) {
      return GroupSections(
        group: group,
        sections: sectionsByGroupId[group.groupId] ?? const [],
      );
    }).toList(growable: false);
  }
}
