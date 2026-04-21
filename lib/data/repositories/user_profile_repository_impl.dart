import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserLocalDataSource _local;
  UserProfileRepositoryImpl(this._local);

  @override
  Future<String> ensureLocalProfileId() async {
    final p = await _local.ensureLocalProfile();
    return p.profileId;
  }

  @override
  Future<bool> hasSeenHowItWorksOnStickerClick(String profileId) {
    return _local.hasSeenHowItWorksOnStickerClick(profileId);
  }

  @override
  Future<void> setHasSeenHowItWorksOnStickerClick(String profileId, bool value) {
    return _local.setHasSeenHowItWorksOnStickerClick(profileId, value);
  }
}
