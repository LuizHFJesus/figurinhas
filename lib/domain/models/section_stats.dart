class SectionStats {
  final String userAlbumId;
  final String sectionId;

  final int total;
  final int obtained;
  final int missing;
  final int duplicates;
  final double progress;

  const SectionStats({
    required this.userAlbumId,
    required this.sectionId,
    required this.total,
    required this.obtained,
    required this.missing,
    required this.duplicates,
    required this.progress,
  });
}
