import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';

class SectionRouteArgs {
  final String sectionId;
  final UserAlbum? album;
  final Section? section;
  final SectionStats? stats;
  final List<Section>? allSections;

  const SectionRouteArgs({
    required this.sectionId,
    this.album,
    this.section,
    this.stats,
    this.allSections,
  });
}
