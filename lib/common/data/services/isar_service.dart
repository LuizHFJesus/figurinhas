import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';

class IsarService extends GetxService {
  late final Isar _isar;

  Isar get isar => _isar;

  Future<IsarService> init() async {
    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        AlbumSchema,
        AlbumStatsSchema,
        GroupSchema,
        SectionSchema,
        SectionStatsSchema,
        StickerSchema,
      ],
      directory: dir.path,
    );

    return this;
  }

  Future<void> cleanDatabase() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
