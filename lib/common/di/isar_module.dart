import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_manager_wc22/data/entities/album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/album_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/group_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_profile_entity.dart';

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();

  return Isar.open(
    [
      // Catalog
      AlbumEntitySchema,
      GroupEntitySchema,
      SectionEntitySchema,
      StickerEntitySchema,

      // User
      UserAlbumEntitySchema,
      UserProfileEntitySchema,

      // User state
      AlbumStatsStateEntitySchema,
      SectionStatsStateEntitySchema,
      StickerStateEntitySchema,
    ],
    directory: dir.path,
  );
}
