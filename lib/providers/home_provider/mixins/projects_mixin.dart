import 'package:flutter/material.dart';

import '../../../resource/app_images.dart';
import 'package:portfolio/utilities/globals.dart' as globals;

mixin ProjectsMixin on ChangeNotifier {

  final List projectDetailsList = [
    {
      "title": "Quiz App",
      "redirectionLink": globals.screenshotQuizApp,
      "image": AppImages.quizAppPng,
      "description": "A feature-rich Flutter-based quiz application designed for an engaging and user-friendly experience. The app leverages GetX state management and GetX Storage for efficient handling of application state and local data storage. It dynamically loads quiz questions from a JSON file, supports user progress tracking, and provides detailed performance analytics.",
      "technology": ["Flutter","Dart","GetX","GetStorage","MVVM"],
      "link": {
        "Github": globals.githubQuizApp,
        "Android App": globals.apkQuizApp,
      },
    },
    {
      "title": "QR Login App",
      "redirectionLink": globals.screenshotQrApp,
      "image": AppImages.loginAppPng,
      "description": "A Flutter-based mobile application leveraging Firebase Phone Authentication, QR code generation, and login history management. The app follows the Clean Architecture principles and utilizes the Bloc state management pattern to ensure scalability and maintainability. It provides a seamless authentication experience, securely stores user activity details, and efficiently handles data using Firebase services.",
      "technology": ["Flutter","Dart","Bloc","Firebase","Clean Architecture"],
      "link": {
        "Github": globals.githubQRLoginApp,
        "Android App": globals.apkQrLoginApp,
      },
    },
    {
      "title": "Portfolio App",
      "redirectionLink": globals.screenshotPortfolioApp,
      "image": AppImages.portfolioNamePng,
      "description": "A modern, fully responsive portfolio application built using Flutter, showcasing personal projects, skills, and professional achievements. The app is designed for both web and mobile platforms, offering an optimized user experience on all devices. The Provider state management approach ensures efficient and scalable app functionality.",
      "technology": ["Flutter","Dart","Provider","MVVM"],
      "link": {
        "Github": globals.githubPortfolio,
        "Android App": globals.apkPortfolioApp,
      },
    }
  ];

  int _hoverIndex = -1;
  bool _isOverAllRedirection = false;

  bool get isOverAllRedirection => _isOverAllRedirection;
  int get projectHoverIndex => _hoverIndex;

  void projectSetHoverIndex(int index) {
    _hoverIndex = index;
    notifyListeners();
  }

  void overAllRedirection(bool isOverAllRedirection){
    _isOverAllRedirection = isOverAllRedirection;
    notifyListeners();
  }
}
