class AlbumStats {
  final String userAlbumId;

  final int total;
  final int obtained;
  final int missing;
  final int duplicates;
  final double progress;

  final int totalFoils;
  final int obtainedFoils;
  final int missingFoils;

  const AlbumStats({
    required this.userAlbumId,
    required this.total,
    required this.obtained,
    required this.missing,
    required this.duplicates,
    required this.progress,
    required this.totalFoils,
    required this.obtainedFoils,
    required this.missingFoils,
  });
}
