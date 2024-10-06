import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:food_app/models/ads_test/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannarContainer extends StatefulWidget {
  const AdBannarContainer({super.key});

  @override
  State<AdBannarContainer> createState() => _AdBannarContainerState();
}

class _AdBannarContainerState extends State<AdBannarContainer> {
  late BannerAd bannerAd;
  bool _isAdReady = false;
  final AdSize _adSize = AdSize.banner;

  void _createBannarAd() {
    bannerAd = BannerAd(
        size: _adSize,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            _isAdReady = true;
            print('add is loaded sucessfully ');
          });
        }, onAdFailedToLoad: (ad, error) {
          print('ad failed to load: ${error.message}');
        }),
        request: const AdRequest());

    bannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createBannarAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdReady) {
      return Container(
        width: _adSize.width.toDouble(),
        height: _adSize.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      );
    } else {
      return Container();
    }
  }
}
