mixin UserProfileRepository {
  Future<String> ensureLocalProfileId();
  Future<bool> hasSeenHowItWorksOnStickerClick(String profileId);
  Future<void> setHasSeenHowItWorksOnStickerClick(String profileId, bool value);
  Future<bool> isAdsRemoved(String profileId);
  Future<void> setAdsRemoved(String profileId, {required bool value});
}
