import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:portfolio/widgets/primary_text.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class StickyHeader extends StatelessWidget {
  const StickyHeader({
    super.key,
    this.index,
    required this.title,
    required this.child,

  });

  final int? index;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: index == 0 ? const SizedBox(height: 40,) : Container(
         color: AppColors.primaryColor.withValues(alpha: 0.99),
         padding:const EdgeInsets.all(25.0),
          alignment: Alignment.centerLeft,
          child: PrimaryText(
            text: title,
            size: AppDimen.textSize22,
            weight: AppFont.bold,
          )
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: child,
              ),
          childCount: 1,
        ),
      ),
    );
  }
}