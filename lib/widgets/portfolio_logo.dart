import 'dart:math';

import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class PortfolioLogo extends StatelessWidget {
  final String appName;
  final bool isHover;
  const PortfolioLogo({super.key, required this.appName, required this.isHover});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.linearGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(4, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(2),
      child: CustomPaint(
        size: isHover ? Size(140, 140) : Size(120, 120),
        painter: ModernLogoPainter(appName: appName, isHover: isHover),
      ),
    );
  }
}

class ModernLogoPainter extends CustomPainter {
  final String appName;
  final bool isHover;
  const ModernLogoPainter({required this.appName,required this.isHover});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final hexagonRadius = size.width / 2;
    final circleRadius = hexagonRadius * 0.7;

    final hexagonPaint = Paint()
      ..shader = const LinearGradient(
        colors: AppColors.linearGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: hexagonRadius))
      ..style = PaintingStyle.fill;

    final hexagonPath = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60.0 - 30.0) * (3.14159 / 180.0);
      final x = center.dx + hexagonRadius * cos(angle);
      final y = center.dy + hexagonRadius * sin(angle);
      if (i == 0) {
        hexagonPath.moveTo(x, y);
      } else {
        hexagonPath.lineTo(x, y);
      }
    }
    hexagonPath.close();
    canvas.drawPath(hexagonPath, hexagonPaint);

    final innerCirclePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, circleRadius * 0.9, innerCirclePaint);

    final arcRect = Rect.fromCircle(center: center, radius: circleRadius);
    final arcPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(arcRect, 3.14 / 4, 3.14 / 2, false, arcPaint); // Top arc
    canvas.drawArc(arcRect, -3.14 / 4, -3.14 / 2, false, arcPaint); // Bottom arc

    final textPainter = TextPainter(
      text: TextSpan(
        text: appName,
        style: TextStyle(
          color: Colors.white,
          fontSize: circleRadius * 0.25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.4),
              offset: const Offset(2, 2),
              blurRadius: 6,
            )
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}