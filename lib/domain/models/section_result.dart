import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

class StickerWithQuantity {
  final Sticker sticker;
  final int quantity;

  const StickerWithQuantity(this.sticker, this.quantity);
}

class SectionResult {
  final Section section;
  final SectionStats stats;
  final List<StickerWithQuantity> stickers; // already filtered if needed

  const SectionResult({
    required this.section,
    required this.stats,
    required this.stickers,
  });
}
