import 'dart:convert';

import 'package:sticker_manager_wc22/common/utils/text_normalizer.dart';
import 'package:sticker_manager_wc22/data/datasources/catalog_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/group_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_entity.dart';
import 'package:sticker_manager_wc22/data/mappers/entity_mappers.dart';
import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogLocalDataSource _local;

  CatalogRepositoryImpl(this._local);

  @override
  Future<void> importCatalogFromJsonString(String json) async {
    final decoded = jsonDecode(json) as Map<String, dynamic>;

    final albumId = decoded['id'] as String;
    final edition = decoded['edition'] as String;

    final album = AlbumEntity()
      ..albumId = albumId
      ..edition = edition;

    final groups = <GroupEntity>[];
    final sections = <SectionEntity>[];
    final stickers = <StickerEntity>[];

    var groupOrder = 0;

    for (final g in (decoded['groups'] as List<dynamic>)) {
      final gm = g as Map<String, dynamic>;
      final groupId = gm['id'] as String;
      final groupName = gm['name'] as String;

      final groupSearch = TextNormalizer.buildSearchText([
        groupId,
        groupName,
        // allow "grupo a" searches too
        groupName.replaceAll('Group', 'Grupo'),
      ]);

      groups.add(
        GroupEntity()
          ..groupId = groupId
          ..albumId = albumId
          ..name = groupName
          ..order = groupOrder
          ..searchText = groupSearch,
      );

      var sectionOrder = 0;

      for (final s in (gm['sections'] as List<dynamic>)) {
        final sm = s as Map<String, dynamic>;
        final sectionId = sm['id'] as String;
        final sectionName = sm['name'] as String;
        final icon = sm['icon'] as String;
        final emoji = sm['emoji'] as String?;

        final sectionSearch = TextNormalizer.buildSearchText([
          sectionId,
          sectionName,
          groupId,
          groupName,
          groupName.replaceAll('Group', 'Grupo'),
        ]);

        sections.add(
          SectionEntity()
            ..sectionId = sectionId
            ..albumId = albumId
            ..groupId = groupId
            ..name = sectionName
            ..icon = icon
            ..emoji = emoji
            ..order = sectionOrder
            ..searchText = sectionSearch,
        );

        var stickerOrder = 0;

        for (final st in (sm['stickers'] as List<dynamic>)) {
          final stm = st as Map<String, dynamic>;
          final code = stm['code'] as String;
          final displayName = stm['displayName'] as String;
          final isFoil = (stm['isFoil'] as bool?) ?? false;

          final stickerSearch = TextNormalizer.buildSearchText([
            code,
            displayName,
            sectionId,
            sectionName,
            groupId,
            groupName,
            groupName.replaceAll('Group', 'Grupo'),
          ]);

          stickers.add(
            StickerEntity()
              ..code = code
              ..albumId = albumId
              ..groupId = groupId
              ..sectionId = sectionId
              ..displayName = displayName
              ..isFoil = isFoil
              ..order = stickerOrder
              ..searchText = stickerSearch,
          );

          stickerOrder++;
        }

        sectionOrder++;
      }

      groupOrder++;
    }

    await _local.upsertCatalog(
      album: album,
      groups: groups,
      sections: sections,
      stickers: stickers,
    );
  }

  @override
  Future<List<Group>> getGroups(String albumId) async {
    final list = await _local.getGroups(albumId);
    return list.map(EntityMappers.toGroup).toList(growable: false);
  }

  @override
  Future<List<Section>> getSectionsByGroup({
    required String albumId,
    required String groupId,
  }) async {
    final list = await _local.getSectionsByGroup(
      albumId: albumId,
      groupId: groupId,
    );
    return list.map(EntityMappers.toSection).toList(growable: false);
  }

  @override
  Future<Section> getSectionById({
    required String albumId,
    required String sectionId,
  }) async {
    final e = await _local.getSectionById(
      albumId: albumId,
      sectionId: sectionId,
    );
    if (e == null) throw StateError('Section not found: $albumId/$sectionId');
    return EntityMappers.toSection(e);
  }

  @override
  Future<List<String>> getAllSectionIds(String albumId) =>
      _local.getAllSectionIds(albumId);

  @override
  Future<List<Sticker>> getAllStickers(String albumId) async {
    final list = await _local.getAllStickers(albumId);
    return list.map(EntityMappers.toSticker).toList(growable: false);
  }

  @override
  Future<int> countStickers(String albumId) => _local.countStickers(albumId);

  @override
  Future<int> countFoils(String albumId) => _local.countFoils(albumId);

  @override
  Future<int> countStickersBySection({
    required String albumId,
    required String sectionId,
  }) => _local.countStickersBySection(albumId: albumId, sectionId: sectionId);

  @override
  Future<int> countFoilsBySection({
    required String albumId,
    required String sectionId,
  }) => _local.countFoilsBySection(albumId: albumId, sectionId: sectionId);

  @override
  Future<List<Sticker>> getStickersBySection({
    required String albumId,
    required String sectionId,
  }) async {
    final list = await _local.getStickersBySection(
      albumId: albumId,
      sectionId: sectionId,
    );
    return list.map(EntityMappers.toSticker).toList(growable: false);
  }

  @override
  Future<List<String>> searchSectionIds({
    required String albumId,
    required String query,
    int limit = 50,
  }) async {
    final q = TextNormalizer.normalize(query);
    if (q.isEmpty) return getAllSectionIds(albumId);

    final sectionHits = await _local.searchSections(
      albumId: albumId,
      normalizedQuery: q,
      limit: limit,
    );

    final fromStickers = await _local.searchSectionIdsFromStickers(
      albumId: albumId,
      normalizedQuery: q,
      limit: 300,
    );

    final set = <String>{};
    for (final s in sectionHits) {
      set.add(s.sectionId);
    }
    set.addAll(fromStickers);

    // Preserve order by section.order (fetch all hits from Section table
    // for sorting)
    final ordered = sectionHits.map((e) => e.sectionId).toList();
    for (final id in fromStickers) {
      if (!ordered.contains(id)) ordered.add(id);
    }

    // Fallback: if stickers hit a section not in sectionHits list, keep
    // /insertion order.
    return ordered.where(set.contains).toList(growable: false);
  }

  @override
  Future<bool> isFoilByCode(String code) => _local.isFoilByCode(code);

  @override
  Future<String> getSectionIdByCode(String code) async {
    final s = await _local.getSectionIdByCode(code);
    if (s == null) throw StateError('Sticker code not found in catalog: $code');
    return s;
  }
}
