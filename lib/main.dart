import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/routs/app_route.dart';

import 'app/theme/app_theme.dart';
import 'app/theme/theme_service.dart';

void main() {
  Get.put(ThemeService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/phone_login',
      getPages: AppRoute.routs,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Get.find<ThemeService>().themeMode,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
