import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/common/utils/failure.dart';

abstract class IStickerLocalDataSource {
  Future<Either<Failure, void>> saveStickers(List<Sticker> stickers);

  Future<Either<Failure, void>> updateSticker(Sticker sticker);

  Future<Either<Failure, List<Sticker>>> getStickersBySection(String sectionId);

  Future<Either<Failure, List<Sticker>>> getAllStickers(String albumId);

  Future<Either<Failure, List<Sticker>>> getRepeatedStickers(String albumId);

  Future<Either<Failure, List<Sticker>>> getMissingStickers(String albumId);

  Future<Either<Failure, List<Sticker>>> searchStickers(
    String albumId,
    String query,
  );
}
