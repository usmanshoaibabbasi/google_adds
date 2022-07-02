import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobHelper {
  static String get bannerUnit => 'ca-app-pub-3940256099942544/6300978111';
  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
      request: const AdRequest(),
      size: AdSize.fullBanner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdClosed: (Ad ad) {
          if (kDebugMode) {
            print('Ad Closed');
          }
        },
        onAdFailedToLoad: (Ad ad, error) {
          ad.dispose();
        },
        onAdLoaded: (Ad ad) {
          if (kDebugMode) {
            print('Ad loaded');
          }
        },
        onAdOpened: (Ad ad) {
          if (kDebugMode) {
            print('ad opened');
          }
        },
      ),
    );
    return bAd;
  }

  static NativeAd loadNativeAd() {
    NativeAd _ad = NativeAd(
      request: const AdRequest(),

      ///This is a test adUnitId make sure to change it
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: 'listTile',
      listener: NativeAdListener(onAdLoaded: (ad) {
        if (kDebugMode) {
          print('Ad loaded');
        }
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();

        if (kDebugMode) {
          print('failed to load the ad ${error.message}, ${error.code}');
        }
      }),
    );
    return _ad;
  }
}
