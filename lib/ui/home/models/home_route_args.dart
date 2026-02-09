import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';

class HomeRouteArgs {
  final UserAlbum? album;
  final AlbumStats? albumStats;

  const HomeRouteArgs({
    this.album,
    this.albumStats,
  });
}
