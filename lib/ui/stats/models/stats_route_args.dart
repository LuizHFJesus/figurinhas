import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';

class StatsRouteArgs {
  final UserAlbum? album;
  final AlbumStats? stats;

  const StatsRouteArgs({
    this.album,
    this.stats,
  });
}
