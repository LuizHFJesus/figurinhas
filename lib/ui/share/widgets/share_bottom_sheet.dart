import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/bottom_sheet_tile.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/custom_bottom_sheet.dart';
import 'package:sticker_manager_wc22/ui/share/models/share_option_type.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'share_title'.tr,
      options: [
        BottomSheetTile(
          icon: 'repeated',
          label: 'share_missing'.tr,
          onTap: () => Navigator.pop(
            context,
            ShareOptionType.missingStickers,
          ),
        ),
        BottomSheetTile(
          icon: 'repeated-two',
          label: 'share_repeated'.tr,
          onTap: () => Navigator.pop(
            context,
            ShareOptionType.repeatedStickers,
          ),
        ),
        BottomSheetTile(
          icon: 'sharing',
          label: 'share_app'.tr,
          onTap: () => Navigator.pop(
            context,
            ShareOptionType.shareApp,
          ),
        ),
      ],
    );
  }
}
