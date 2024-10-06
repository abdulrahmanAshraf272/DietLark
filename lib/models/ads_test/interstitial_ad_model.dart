import 'dart:async';

import 'package:food_app/hold_values.dart';
import 'package:food_app/models/ads_test/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyInterstitailAd {
  static late InterstitialAd _interstitialAd;
  static bool isAdReady = false;

  static void loadInterstitialAd() async {
    await InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          isAdReady = true;
          _interstitialAd = ad;
          print('intersitial ad is loaded sucessfully');
        }, onAdFailedToLoad: (error) {
          print('onAdFailedToLoad : $error');
        }));
  }

  static void showInterstitialAd() {
    if (isAdReady) {
      _interstitialAd.show();
    }
  }
}

void displayAdNotiIsClicked() {
  if (HoldValues.notificationClicked) {
    MyInterstitailAd.loadInterstitialAd();
    Timer(Duration(seconds: 5), () {
      MyInterstitailAd.showInterstitialAd();
      HoldValues.notificationClicked = false;
    });
  }
}

void displayInterstialAdDipose() {
  Timer(Duration(seconds: 1), () {
    MyInterstitailAd.showInterstitialAd();
  });
}
