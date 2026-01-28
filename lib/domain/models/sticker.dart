class Sticker {
  final String code;
  final String albumId;
  final String groupId;
  final String sectionId;
  final String displayName;
  final bool isFoil;
  final int order;

  const Sticker({
    required this.code,
    required this.albumId,
    required this.groupId,
    required this.sectionId,
    required this.displayName,
    required this.isFoil,
    required this.order,
  });
}
