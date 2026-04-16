import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';

class ClearAlbumUseCase {
  final StickerStateRepository _stickerRepository;
  final StatsRepository _statsRepository;

  ClearAlbumUseCase(this._stickerRepository, this._statsRepository);

  Future<void> call(String userAlbumId) async {
    await _stickerRepository.clearUserAlbumStates(userAlbumId);
    await _statsRepository.resetUserAlbumStats(userAlbumId);
  }
}
