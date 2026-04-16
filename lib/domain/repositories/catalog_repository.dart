import 'package:sticker_manager_wc22/domain/models/album.dart';
import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

abstract class CatalogRepository {
  Future<Album> importCatalogFromJsonString(String json);

  Future<Album?> getAlbum(String albumId);

  Future<List<Group>> getGroups(String albumId);

  Future<List<Section>> getSectionsByGroup({
    required String albumId,
    required String groupId,
  });

  Future<List<Section>> getAllSections(String albumId);

  Future<Section> getSectionById({
    required String albumId,
    required String sectionId,
  });

  Future<List<String>> getAllSectionIds(String albumId);

  Future<List<Sticker>> getAllStickers(String albumId);

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
