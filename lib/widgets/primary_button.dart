import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_dimension.dart';
import 'package:portfolio/resource/app_font.dart';

import '../resource/app_colors.dart';
import 'primary_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

   PrimaryButton({
    required this.text,
    required this.onPressed,
    required this.isSelected,
    super.key,
  });

  final ValueNotifier<bool> _isHovering = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
          _isHovering.value = true;
      },
      onExit: (_) {
          _isHovering.value = false;
      },
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                ValueListenableBuilder<bool>(
                valueListenable: _isHovering,
                builder: (context, value, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: 1,
                      width: value || isSelected ? 56 : 28,
                      color: value || isSelected ? AppColors.primaryTextColor : AppColors.primaryLightTextColor,
                    ),
                    const SizedBox(width: 12),
                    PrimaryText(
                      text: text,
                      color:  value || isSelected ? AppColors.primaryTextColor : AppColors.primaryLightTextColor,
                      size: AppDimen.textSize14,
                      weight: AppFont.bold,
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}