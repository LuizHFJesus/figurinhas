import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/data/datasources/catalog_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/group_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_entity.dart';

class IsarCatalogLocalDataSource implements CatalogLocalDataSource {
  final Isar _isar;

  IsarCatalogLocalDataSource(this._isar);

  @override
  Future<void> upsertCatalog({
    required AlbumEntity album,
    required List<GroupEntity> groups,
    required List<SectionEntity> sections,
    required List<StickerEntity> stickers,
  }) async {
    await _isar.writeTxn(() async {
      await _isar.albumEntitys.put(album);

      await _isar.groupEntitys
          .filter()
          .albumIdEqualTo(album.albumId)
          .deleteAll();
          
      await _isar.sectionEntitys
          .filter()
          .albumIdEqualTo(album.albumId)
          .deleteAll();
          
      await _isar.stickerEntitys
          .filter()
          .albumIdEqualTo(album.albumId)
          .deleteAll();

      await _isar.groupEntitys.putAll(groups);
      await _isar.sectionEntitys.putAll(sections);
      await _isar.stickerEntitys.putAll(stickers);
    });
  }

  @override
  Future<AlbumEntity?> getAlbum(String albumId) {
    return _isar.albumEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .findFirst();
  }

  @override
  Future<List<GroupEntity>> getGroups(String albumId) {
    return _isar.groupEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .sortByOrder()
        .findAll();
  }

  @override
  Future<List<SectionEntity>> getSectionsByGroup({
    required String albumId,
    required String groupId,
  }) {
    return _isar.sectionEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .and()
        .groupIdEqualTo(groupId)
        .sortByOrder()
        .findAll();
  }

  @override
  Future<List<SectionEntity>> getAllSections(String albumId) {
    return _isar.sectionEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .findAll();
  }

  @override
  Future<SectionEntity?> getSectionById({
    required String albumId,
    required String sectionId,
  }) {
    return _isar.sectionEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .sectionIdEqualTo(sectionId)
      .findFirst();
  }

  @override
  Future<List<String>> getAllSectionIds(String albumId) async {
    final sections = await _isar.sectionEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .findAll();
    return sections.map((e) => e.sectionId).toList(growable: false);
  }

  @override
  Future<List<StickerEntity>> getAllStickers(String albumId) {
    return _isar.stickerEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .sortByOrder()
        .findAll();
  }

  @override
  Future<int> countStickers(String albumId) {
    return _isar.stickerEntitys.filter().albumIdEqualTo(albumId).count();
  }

  @override
  Future<int> countFoils(String albumId) {
    return _isar.stickerEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .isFoilEqualTo(true)
      .count();
  }

  @override
  Future<int> countStickersBySection({
    required String albumId,
    required String sectionId,
  }) {
    return _isar.stickerEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .sectionIdEqualTo(sectionId)
      .count();
  }

  @override
  Future<int> countFoilsBySection({
    required String albumId,
    required String sectionId,
  }) {
    return _isar.stickerEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .sectionIdEqualTo(sectionId)
      .and()
      .isFoilEqualTo(true)
      .count();
  }

  @override
  Future<List<StickerEntity>> getStickersBySection({
    required String albumId,
    required String sectionId,
  }) {
    return _isar.stickerEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .sectionIdEqualTo(sectionId)
      .sortByOrder()
      .findAll();
  }

  @override
  Future<List<SectionEntity>> searchSections({
    required String albumId,
    required String normalizedQuery,
    int limit = 50,
  }) {
    return _isar.sectionEntitys
      .filter()
      .albumIdEqualTo(albumId)
      .and()
      .searchTextContains(normalizedQuery)
      .sortByOrder()
      .limit(limit)
      .findAll();
  }

  @override
  Future<List<String>> searchSectionIdsFromStickers({
    required String albumId,
    required String normalizedQuery,
    int limit = 200,
  }) async {
    final hits = await _isar.stickerEntitys
        .filter()
        .albumIdEqualTo(albumId)
        .and()
        .searchTextContains(normalizedQuery)
        .limit(limit)
        .findAll();

    // Return sectionIds (dedupe later at repo)
    return hits.map((e) => e.sectionId).toList(growable: false);
  }

  @override
  Future<bool> isFoilByCode(String code) async {
    final st = await _isar.stickerEntitys
        .filter()
        .codeEqualTo(code)
        .findFirst();
    return st?.isFoil ?? false;
  }

  @override
  Future<String?> getSectionIdByCode(String code) async {
    final st = await _isar.stickerEntitys
        .filter()
        .codeEqualTo(code)
        .findFirst();
    return st?.sectionId;
  }
}
