import 'package:flutter/cupertino.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';

class AppRoutes {
 static Map<String,WidgetBuilder> routs = {
   AppRouteEnum.homePage.name : (context) => HomeScreen(),
  };
}

enum AppRouteEnum{
  homePage,
}
