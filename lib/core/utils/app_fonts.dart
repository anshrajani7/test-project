

import 'package:fiverr_task/core/app_export.dart';

abstract class AppStyle {
  /// Default font family
  static const String defaultFontOfApp = 'Gilroy';
  static const String _defaultFontFamily = defaultFontOfApp;
  static const FontWeight _defaultFontWeight = FontWeight.w400;

  static TextStyle style(double size,
      {Color? fontColor, String? fontFamily, FontWeight? fontWeight}) {
    const defaultFontColor = ColorConstant.textBlack;
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: size, //12,
            fontWeight: fontWeight ?? _defaultFontWeight,
            color: fontColor ?? defaultFontColor);
    }
  }
