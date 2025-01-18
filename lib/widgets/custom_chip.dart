import 'package:flutter/material.dart';
import 'package:portfolio/widgets/primary_text.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class CustomChip extends StatelessWidget {
  final String text;
  const CustomChip({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.foregroundColor,
      ),
      child: PrimaryText(
        text: text,
        color: AppColors.linkTextColor,
        size: AppDimen.textSize12,
        weight: AppFont.medium,
      ),
    );
  }
}
