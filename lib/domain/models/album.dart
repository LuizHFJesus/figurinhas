class Album {
  final String albumId;
  final String edition;
  final int? version;

  const Album({
    required this.albumId,
    required this.edition,
    this.version,
  });
}
