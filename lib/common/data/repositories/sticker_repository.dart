import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/data/repositories/i_sticker_repository.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_sticker_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class StickerRepository implements IStickerRepository {
  final IStickerLocalDataSource localDataSource;

  StickerRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Sticker>>> getStickersBySection(
    String sectionId,
  ) => localDataSource.getStickersBySection(sectionId);

  @override
  Future<Either<Failure, void>> updateSticker(Sticker sticker) =>
      localDataSource.updateSticker(sticker);

  @override
  Future<Either<Failure, List<Sticker>>> getAllStickers(String albumId) =>
      localDataSource.getAllStickers(albumId);

  @override
  Future<Either<Failure, List<Sticker>>> getRepeatedStickers(String albumId) =>
      localDataSource.getRepeatedStickers(albumId);

  @override
  Future<Either<Failure, List<Sticker>>> getMissingStickers(String albumId) =>
      localDataSource.getMissingStickers(albumId);

  @override
  Future<Either<Failure, List<Sticker>>> searchStickers(
    String albumId,
    String query,
  ) => localDataSource.searchStickers(albumId, query);
}
