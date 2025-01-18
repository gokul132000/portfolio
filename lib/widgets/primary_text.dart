import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  const PrimaryText({super.key,required this.text,this.size = AppDimen.textSize16,this.weight = AppFont.regular,this.color = AppColors.primaryTextColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: AppFont.font,
        color: color,
        fontWeight: weight,
        height: 1.5,
      ),
    );
  }

}
