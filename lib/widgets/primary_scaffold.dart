import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/widgets/scaffold_glow_painter.dart';

import '../resource/app_colors.dart';

class PrimaryScaffold extends StatelessWidget{
  final Widget body;
  PrimaryScaffold({super.key, required this.body});

  final ValueNotifier<Offset> _mousePosition = ValueNotifier<Offset>(Offset.zero);

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: ColoredBox(
                 color: AppColors.primaryColor,
                  child: MouseRegion(
                      onHover: (PointerHoverEvent event) {
                          _mousePosition.value = event.localPosition;
                      },
                      onExit: (_) {
                          _mousePosition.value = Offset.zero;
                      },
                      child: body
                  )
              ),
            ),
        // Usage in your widget
        ValueListenableBuilder<Offset>(
          valueListenable: _mousePosition,
          builder: (context, value, child) {
            return CustomPaint(
              painter: SingleGlowPainter(
                mousePosition: value,
               primaryColor: AppColors.bgGlowColor,
                glowRadius: 300.0,
                pulseFactor: 0.8,
              ),
                );
          }
        ),
          ],
        ),
    );
  }
}