import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/ui/share/models/share_option_type.dart';
import 'package:sticker_manager_wc22/ui/share/usecases/generate_share_stickers_text_usecase.dart';
import 'package:sticker_manager_wc22/ui/share/widgets/share_bottom_sheet.dart';

class ShareCoordinator {
  final GenerateShareStickersTextUseCase _generateShareText;

  ShareCoordinator(this._generateShareText);

  Future<void> showShareOptions(BuildContext context, UserAlbum album) async {
    final scaffoldContext = Scaffold.of(context).context;
    final option = await showModalBottomSheet<ShareOptionType>(
      context: scaffoldContext,
      isScrollControlled: true,
      builder: (_) => const ShareBottomSheet(),
    );

    if (option != null && scaffoldContext.mounted) {
      await _handleShareOption(scaffoldContext, option, album);
    }
  }

  Future<void> _handleShareOption(
    BuildContext context,
    ShareOptionType option,
    UserAlbum album,
  ) async {
    switch (option) {
      case ShareOptionType.missingStickers:
        await _shareStickers(
          context,
          album,
          StickerFilter.missing,
        );

      case ShareOptionType.repeatedStickers:
        await _shareStickers(
          context,
          album,
          StickerFilter.repeated,
        );

      case ShareOptionType.albumStats:
      case ShareOptionType.shareApp:
    }
  }

  Future<void> _shareStickers(
    BuildContext context,
    UserAlbum album,
    StickerFilter filter,
  ) async {
    final text = await _generateShareText.call(
      albumId: album.albumId,
      userAlbumId: album.userAlbumId,
      albumName: album.name,
      filter: filter,
    );

    if (text.trim().isNotEmpty) {
      await SharePlus.instance.share(ShareParams(text: text));
    }
  }
}
