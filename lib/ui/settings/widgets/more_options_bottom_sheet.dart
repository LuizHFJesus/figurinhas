import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/bottom_sheet_tile.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/custom_bottom_sheet.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';

class MoreOptionsBottomSheet extends StatelessWidget {
  const MoreOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'more_options_title'.tr,
      options: [
        BottomSheetTile(
          icon: 'trash',
          label: 'more_options_clear_album'.tr,
          onTap: () => Navigator.pop(
            context,
            MoreOptionType.clearAlbum,
          ),
        ),
      ],
    );
  }
}
