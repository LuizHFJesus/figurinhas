import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/utils/failure.dart';

abstract class IAlbumLocalDataSource {
  Future<Either<Failure, void>> saveAlbum(Album album);

  Future<Either<Failure, List<Album>>> getAlbums();

  Future<Either<Failure, Album?>> getActiveAlbum();

  Future<Either<Failure, void>> updateAlbum(Album album);

  Future<Either<Failure, void>> deleteAlbum(int id);
}
