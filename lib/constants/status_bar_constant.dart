import 'package:flutter/services.dart';
import 'package:tourease/constants/color_constant.dart';

class StatusBarConstant {
  static void statusBar = SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorCollection.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
