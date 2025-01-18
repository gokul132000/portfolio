import 'package:flutter/material.dart';
import 'package:portfolio/app/app_route.dart';

import '../resource/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.scrollBarColor),
          trackColor: WidgetStateProperty.all(AppColors.scrollBarBgColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteEnum.homePage.name,
      routes: AppRoutes.routs,
    );
  }
}
