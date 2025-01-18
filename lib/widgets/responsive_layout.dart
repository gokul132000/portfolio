import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayoutWidget;
  final Widget webLayoutWidget;

  const ResponsiveLayout({super.key, required this.mobileLayoutWidget, required this.webLayoutWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 1024
            ? webLayoutWidget
            : mobileLayoutWidget;
      },
    );
  }
}
