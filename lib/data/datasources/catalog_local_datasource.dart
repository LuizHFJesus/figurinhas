import 'package:sticker_manager_wc22/data/entities/album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/group_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_entity.dart';

abstract class CatalogLocalDataSource {
  Future<void> upsertCatalog({
    required AlbumEntity album,
    required List<GroupEntity> groups,
    required List<SectionEntity> sections,
    required List<StickerEntity> stickers,
  });

  Future<AlbumEntity?> getAlbum(String albumId);

  Future<List<GroupEntity>> getGroups(String albumId);

  Future<List<SectionEntity>> getSectionsByGroup({
    required String albumId,
    required String groupId,
  });

  Future<SectionEntity?> getSectionById({
    required String albumId,
    required String sectionId,
  });

  Future<List<String>> getAllSectionIds(String albumId);

  Future<List<StickerEntity>> getAllStickers(String albumId);

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

  Future<List<StickerEntity>> getStickersBySection({
    required String albumId,
    required String sectionId,
  });

  Future<List<SectionEntity>> searchSections({
    required String albumId,
    required String normalizedQuery,
    int limit = 50,
  });

  Future<List<String>> searchSectionIdsFromStickers({
    required String albumId,
    required String normalizedQuery,
    int limit = 200,
  });

  Future<bool> isFoilByCode(String code);

  Future<String?> getSectionIdByCode(String code);
}
