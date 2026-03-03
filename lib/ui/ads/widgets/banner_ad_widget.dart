import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatelessWidget {
  final BannerAd? bannerAd;
  final bool isBannerReady;

  const BannerAdWidget({
    required this.bannerAd,
    required this.isBannerReady,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!isBannerReady || bannerAd == null) return const SizedBox.shrink();

    final banner = bannerAd!;
    return Container(
      alignment: Alignment.center,
      width: banner.size.width.toDouble(),
      height: banner.size.height.toDouble(),
      child: AdWidget(ad: banner),
    );
  }
}
