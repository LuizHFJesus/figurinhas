mixin UserProfileRepository {
  Future<String> ensureLocalProfileId();
  Future<bool> hasSeenHowItWorksOnStickerClick(String profileId);
  Future<void> setHasSeenHowItWorksOnStickerClick(String profileId, bool value);
}
