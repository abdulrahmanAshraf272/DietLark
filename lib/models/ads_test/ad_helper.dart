class AdHelper {
  static const bool _testMode = false;

  static String get bannerAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      return 'ca-app-pub-9571050743740707/9186634380';
    }
  }

  static String get interstitialAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/8691691433';
    } else {
      return 'ca-app-pub-9571050743740707/2993880688';
    }
  }
}
