import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class GenerateShareStickersTextUseCase {
  final CatalogRepository _catalog;
  final StickerStateRepository _states;

  GenerateShareStickersTextUseCase(this._catalog, this._states);

  Future<String> call({
    required String albumId,
    required String userAlbumId,
    required String albumName,
    required StickerFilter filter,
  }) async {
    final album = await _catalog.getAlbum(albumId);
    final groups = await _catalog.getGroups(albumId);
    final allStickers = await _catalog.getAllStickers(albumId);
    final quantities = await _states.getAllQuantitiesForUserAlbum(userAlbumId);

    final buffer = StringBuffer();
    if (album != null && album.edition != albumName) {
      buffer.writeln('📚 ${'share_lbl_edition'.tr}: ${album.edition}');
    }
    buffer.writeln('📕 ${'share_lbl_album'.tr}: $albumName\n');


    if (filter == StickerFilter.missing) {
      buffer.writeln('📌 ${'share_missing'.tr}\n');
    } else if (filter == StickerFilter.repeated) {
      buffer.writeln('🔁 ${'share_repeated'.tr}\n');
    }

    for (final group in groups) {
      final sections = await _catalog.getSectionsByGroup(
        albumId: albumId,
        groupId: group.groupId,
      );
      var groupHasStickers = false;

      for (final section in sections) {
        final sectionStickers = allStickers
            .where((s) => s.sectionId == section.sectionId)
            .toList();

        final filtered = sectionStickers.where((s) {
          final qty = quantities[s.code] ?? 0;
          if (filter == StickerFilter.missing) return qty == 0;
          if (filter == StickerFilter.repeated) return qty > 1;
          return false;
        }).toList();

        if (filtered.isNotEmpty) {
          groupHasStickers = true;

          final emoji = section.emoji;
          final prefix = section.tag;

          final numbers = filtered
              .map((s) {
                final numPart = s.code.replaceAll(RegExp('[^0-9]'), '');
                final displayCode = numPart.isNotEmpty ? numPart : s.code;

                if (filter == StickerFilter.repeated) {
                  final qty = quantities[s.code] ?? 0;
                  final repeated = qty - 1;
                  if (repeated > 1) return '$displayCode (x$repeated)';
                }
                return displayCode;
              })
              .join(', ');

          buffer.writeln('$emoji ${section.name} - $prefix: $numbers');
        }
      }

      if (groupHasStickers) buffer.writeln();
    }

    buffer.writeln('📲 ${'share_organize_your_stickers'.tr}:');
    buffer.writeln('share_app_link'.tr);

    return buffer.toString();
  }
}
