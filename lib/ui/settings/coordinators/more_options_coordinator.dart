import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/usecases/clear_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/fill_album_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/text_alert_dialog.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/show_snack_bar.dart';
import 'package:sticker_manager_wc22/ui/settings/widgets/how_it_works_dialog.dart';
import 'package:sticker_manager_wc22/ui/settings/widgets/more_options_bottom_sheet.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum MoreOptionType {
  howItWorks,
  clearAlbum,
  fillAlbum,
  rateApp,
}

class MoreOptionsCoordinator {
  final ClearAlbumUseCase _clearAlbumUseCase;
  final FillAlbumUseCase _fillAlbumUseCase;

  MoreOptionsCoordinator(this._clearAlbumUseCase, this._fillAlbumUseCase);

  Future<void> showMoreOptions(BuildContext context, UserAlbum album) async {
    final scaffoldContext = Scaffold.of(context).context;
    final option = await showModalBottomSheet<MoreOptionType>(
      context: scaffoldContext,
      isScrollControlled: true,
      builder: (_) => const MoreOptionsBottomSheet(),
    );

    if (option != null && scaffoldContext.mounted) {
      await _handleOption(scaffoldContext, option, album);
    }
  }

  Future<void> _handleOption(
    BuildContext context,
    MoreOptionType option,
    UserAlbum album,
  ) async {
    switch (option) {
      case MoreOptionType.howItWorks:
        await _showHowItWorks(context);
      case MoreOptionType.clearAlbum:
        await _clearAlbum(context, album);
      case MoreOptionType.fillAlbum:
        await _fillAlbum(context, album);
      case MoreOptionType.rateApp:
        await _rateApp();
    }
  }

  Future<void> _showHowItWorks(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => const HowItWorksDialog(),
    );
  }

  Future<void> _clearAlbum(BuildContext context, UserAlbum album) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => TextAlertDialog(
        title: 'more_options_clear_album_title'.tr,
        description: 'more_options_clear_album_desc'.tr,
        primaryAction: DialogAction(
          label: 'more_options_clear_album'.tr,
          isDestructive: true,
          onPressed: () => Navigator.pop(ctx, true),
        ),
        secondaryAction: DialogAction(
          label: 'cancel'.tr,
          onPressed: () => Navigator.pop(ctx, false),
        ),
      ),
    );

    if (confirmed ?? false) {
      await _clearAlbumUseCase.call(album.userAlbumId);
      if (context.mounted) {
        showSnackBar(
            context,
            message: 'more_options_album_cleared'.tr,
            type: AppSnackBarType.success
        );
      }
    }
  }

  Future<void> _fillAlbum(BuildContext context, UserAlbum album) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => TextAlertDialog(
        title: 'more_options_fill_album_title'.tr,
        description: 'more_options_fill_album_desc'.tr,
        primaryAction: DialogAction(
          label: 'more_options_fill_album'.tr,
          onPressed: () => Navigator.pop(ctx, true),
        ),
        secondaryAction: DialogAction(
          label: 'cancel'.tr,
          onPressed: () => Navigator.pop(ctx, false),
        ),
      ),
    );

    if (confirmed ?? false) {
      await _fillAlbumUseCase.call(
        userAlbumId: album.userAlbumId,
        albumId: album.albumId,
      );
      if (context.mounted) {
        showSnackBar(
            context,
            message: 'more_options_album_filled'.tr,
            type: AppSnackBarType.success
        );
      }
    }
  }

  Future<void> _rateApp() async {
    final url = 'app_link'.tr;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }
}
