import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

class OverviewSection {
  final Section section;
  final List<Sticker> visibleStickers;

  const OverviewSection({
    required this.section,
    required this.visibleStickers,
  });
}
