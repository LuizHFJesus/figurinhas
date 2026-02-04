import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

abstract class CatalogRepository {
  Future<void> importCatalogFromJsonString(String json);

  Future<List<Group>> getGroups(String albumId);

  Future<List<Section>> getSectionsByGroup({
    required String albumId,
    required String groupId,
  });

  Future<Section> getSectionById({
    required String albumId,
    required String sectionId,
  });

  Future<List<String>> getAllSectionIds(String albumId);

  Future<int> countStickers(String albumId);

  Future<int> countFoils(String albumId);

  Future<int> countStickersBySection({
    required String albumId,
    required String sectionId,
  });

  Future<int> countFoilsBySection({
    required String albumId,
    required String sectionId,
  });

  Future<List<Sticker>> getStickersBySection({
    required String albumId,
    required String sectionId,
  });

  /// Option 1 search (normalized contains) returning sectionIds
  Future<List<String>> searchSectionIds({
    required String albumId,
    required String query,
    int limit = 50,
  });

  Future<bool> isFoilByCode(String code);

  Future<String> getSectionIdByCode(String code);
}
