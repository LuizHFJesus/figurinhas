import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class SetHasSeenHowItWorksUseCase {
  final UserProfileRepository _repository;
  SetHasSeenHowItWorksUseCase(this._repository);

  Future<void> call(String profileId, bool value) {
    return _repository.setHasSeenHowItWorksOnStickerClick(profileId, value);
  }
}
