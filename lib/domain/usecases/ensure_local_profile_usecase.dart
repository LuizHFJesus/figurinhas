import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class EnsureLocalProfileUseCase {
  final UserProfileRepository _repo;
  EnsureLocalProfileUseCase(this._repo);

  Future<String> call() => _repo.ensureLocalProfileId();
}
