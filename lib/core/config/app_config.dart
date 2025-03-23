import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConfig {
  static const String appName = 'FireTask';
  static const String appVersion = '1.0.0';

  // API Endpoints
  static const String baseUrl = 'YOUR_FIREBASE_URL';

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';

  // Screen Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Responsive Design
  static void initScreenUtil(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
  }
}
