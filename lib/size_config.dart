import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static double getScreenHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }

  static double getScreenHeightWithoutStatusBar(BuildContext context) {
    double screenHeightWithoutStatusBar = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return screenHeightWithoutStatusBar;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
