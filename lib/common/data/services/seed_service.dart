import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_album_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_group_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_section_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_stats_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_sticker_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';
import 'package:uuid/uuid.dart';

class SeedService extends GetxService {
  final IAlbumLocalDataSource _albumDataSource =
      Get.find<IAlbumLocalDataSource>();
  final IGroupLocalDataSource _groupDataSource =
      Get.find<IGroupLocalDataSource>();
  final ISectionLocalDataSource _sectionDataSource =
      Get.find<ISectionLocalDataSource>();
  final IStickerLocalDataSource _stickerDataSource =
      Get.find<IStickerLocalDataSource>();
  final IStatsLocalDataSource _statsDataSource =
      Get.find<IStatsLocalDataSource>();

  Future<void> initSeedIfEmpty() async {
    final result = await _albumDataSource.getAlbums();

    result.fold(
      ifLeft: (failure) =>
          print('Erro ao verificar álbuns: ${failure.message}'),
      ifRight: (albums) async {
        if (albums.isEmpty) {
          await _seedFromData();
        }
      },
    );
  }

  Future<void> _seedFromData() async {
    try {
      final response = await rootBundle.loadString(
        'assets/data/qatar_2022.json',
      );
      final data = json.decode(response);
      final now = DateTime.now();

      final rawAlbum = data['album'] as Map<String, dynamic>;
      final album = Album()
        ..id = const Uuid().v4()
        ..name = rawAlbum['name'] as String
        ..edition = rawAlbum['edition'] as String
        ..isActive = true
        ..createdAt = now
        ..updatedAt = now;

      final albumResult = await _albumDataSource.saveAlbum(album);
      if (albumResult.isLeft) return;

      var totalStickersAlbum = 0;
      var totalFoilAlbum = 0;

      final groups = data['groups'] as List<Map<String, dynamic>>;
      for (var i = 0; i < groups.length; i++) {
        final group = Group()
          ..name = groups[i]['name'] as String
          ..displayOrder = i;

        group.album.value = album;

        final catResult = await _groupDataSource.saveGroups([group]);
        if (catResult.isLeft) continue;

        final rawSections = groups[i]['sections'] as List<Map<String, dynamic>>;
        for (var j = 0; j < rawSections.length; j++) {
          final section = Section()
            ..id = const Uuid().v4()
            ..name = rawSections[j]['name'] as String
            ..icon = rawSections[j]['icon'] as String
            ..displayOrder = j;

          section.group.value = group;

          final secResult = await _sectionDataSource.saveSections([section]);
          if (secResult.isLeft) continue;

          final rawStickers =
              rawSections[j]['stickers'] as List<Map<String, dynamic>>;
          final stickersToSave = <Sticker>[];
          var totalInSec = 0;

          for (final rawSticker in rawStickers) {
            final sticker = Sticker()
              ..id = const Uuid().v4()
              ..code = rawSticker['code'] as String
              ..displayName = rawSticker['displayName'] as String
              ..isFoil = rawSticker['isFoil'] as bool? ?? false
              ..quantity = 0
              ..isOwned = false
              ..isRepeated = false
              ..updatedAt = now;
            sticker.section.value = section;

            stickersToSave.add(sticker);

            totalInSec++;
            totalStickersAlbum++;
            if (sticker.isFoil) totalFoilAlbum++;
          }

          await _stickerDataSource.saveStickers(stickersToSave);

          final sectionStats = SectionStats()
            ..albumId = album.id
            ..sectionId = section.id
            ..total = totalInSec
            ..owned = 0
            ..missing = totalInSec
            ..progress = 0.0
            ..updatedAt = now;

          await _statsDataSource.saveSectionStats(sectionStats);
        }
      }

      final albumStats = AlbumStats()
        ..albumId = album.id
        ..total = totalStickersAlbum
        ..owned = 0
        ..repeated = 0
        ..missing = totalStickersAlbum
        ..progress = 0.0
        ..totalFoil = totalFoilAlbum
        ..ownedFoil = 0
        ..updatedAt = now;

      await _statsDataSource.saveAlbumStats(albumStats);

      print('Seed concluído com sucesso para o álbum: ${album.name}');
    } catch (e) {
      print('Erro crítico durante o processo de Seeding: $e');
    }
  }
}
