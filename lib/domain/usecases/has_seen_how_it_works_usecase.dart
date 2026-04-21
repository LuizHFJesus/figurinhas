import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class HasSeenHowItWorksUseCase {
  final UserProfileRepository _repository;
  HasSeenHowItWorksUseCase(this._repository);

  Future<bool> call(String profileId) {
    return _repository.hasSeenHowItWorksOnStickerClick(profileId);
  }
}
