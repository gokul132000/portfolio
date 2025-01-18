import 'package:flutter/material.dart';

class SingleGlowPainter extends CustomPainter {
  final Offset mousePosition;
  final Color primaryColor;
  final double glowRadius;
  final double pulseFactor;

  SingleGlowPainter({
    required this.mousePosition,
    required this.primaryColor,
    this.glowRadius = 350.0,
    this.pulseFactor = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (mousePosition == Offset.zero) return;

    final baseGlowColor = primaryColor.withValues(alpha: 0.4);

    double baseRadius = glowRadius + (mousePosition.distance / 3);
    baseRadius *= pulseFactor;

    for (int i = 0; i < 3; i++) {
      final radius = baseRadius + (i * 50);
      final opacity = 0.3 - (i * 0.1);
      final layerColor = baseGlowColor.withValues(alpha: opacity.clamp(0.0, 1.0));

      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            layerColor.withAlpha(0).withValues(alpha: 0.11),
            layerColor.withValues(alpha: 0.0),
          ],
          stops: [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: mousePosition, radius: radius));

      canvas.drawCircle(mousePosition, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

