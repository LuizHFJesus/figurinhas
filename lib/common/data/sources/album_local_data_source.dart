import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_album_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class AlbumLocalDataSource implements IAlbumLocalDataSource {
  final Isar _isar = Get.find<IsarService>().isar;

  @override
  Future<Either<Failure, void>> saveAlbum(Album album) async {
    try {
      await _isar.writeTxn(() => _isar.albums.put(album));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao salvar álbum: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Album>>> getAlbums() async {
    try {
      final albums = await _isar.albums.where().findAll();
      return Right(albums);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao buscar álbuns: $e'));
    }
  }

  @override
  Future<Either<Failure, Album?>> getActiveAlbum() async {
    try {
      final album = await _isar.albums.filter().isActiveEqualTo(true).findFirst();
      return Right(album);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao buscar álbum ativo: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateAlbum(Album album) async {
    try {
      await _isar.writeTxn(() => _isar.albums.put(album));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao atualizar álbum: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAlbum(int id) async {
    try {
      await _isar.writeTxn(() => _isar.albums.delete(id));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao deletar álbum: $e'));
    }
  }
}