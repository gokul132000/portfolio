import 'package:flutter/material.dart';
import '../../../utilities/globals.dart' as globals;

mixin ExperienceMixin on ChangeNotifier {
  final List experienceDetailsList = [
    {
      "years": "2022 — 2024",
      "role": "Flutter Developer",
      "companyName": "RadicalStart",
      "redirectionLink": globals.radicalOfficialSite,
      "description": "As a Flutter Developer with 2 years and 8 months of experience, I specialize in building high-performance, cross-platform mobile applications. I have a strong track record of deploying seamless apps to the Google Play Store and Apple App Store. My expertise includes integrating payment gateways such as Stripe, PayPal, and PayStack, as well as leveraging Firebase for real-time data synchronization and cloud services. I’ve developed applications based on Uber and rental service platforms, incorporating features like Google Maps for location tracking, push notifications for real-time updates, and chat functionality for user communication. Additionally, I have experience implementing real-time communication using Socket.IO for live data updates and interactive features. With a focus on clean architecture and scalability, I use GetX, Provider, and Flutter Bloc for state management. I am also skilled in integrating GraphQL and REST APIs for robust app functionality. I have successfully migrated apps to the latest Flutter SDK versions with null safety, ensuring performance improvements and future-proofing. My solid foundation in Agile methodologies enables me to deliver high-quality, user-centric solutions aligned with business goals.",
      "skills": [
        "Flutter",
        "Dart",
        "GetX",
        "Provider",
        "Flutter Bloc",
        "MVC",
        "MVVM",
        "Clean Architecture",
        "Firebase",
        "GraphQL",
        "REST APIs",
        "Socket",
        "Payment Gateways",
        "App Deployment",
        "SDK Migration"
      ],
    },
  ];


  int hoverIndex = -1;
  bool isResumeHovered = false;

  void setHoverIndexForExperience(int index) {
    hoverIndex = index;
    notifyListeners();
  }

  void setHoverIndexForResume(bool isHovered) {
    isResumeHovered = isHovered;
    notifyListeners();
  }

  void resetHoverIndex() {
    hoverIndex = -1;
    notifyListeners();
  }
}


