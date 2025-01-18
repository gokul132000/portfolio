import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_font.dart';
import 'package:portfolio/utilities/extension.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_images.dart';

class HoverText extends StatefulWidget {
  final String text;
  final String url;
  final Color hoverColor;
  final bool isArrowEnable;
  final double textSize;
  final double? height;
  final bool? isHoverEnable;
  final bool isLinkEnable;
  final ValueChanged? valueChanged;

  HoverText({
    super.key,
    required this.text,
    required this.url,
    this.hoverColor = AppColors.linkTextColor,
    this.isArrowEnable = false,
    this.textSize = AppDimen.textSize16,
    this.height,
    this.isHoverEnable,
    this.isLinkEnable = false,
    this.valueChanged
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    if(widget.isHoverEnable != null) _isHovered.value = widget.isHoverEnable ?? false;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_){
        if(widget.valueChanged != null) {
          widget.valueChanged!(true);
        }
      _isHovered.value = true;
      },
      onExit: (_){
        if(widget.valueChanged != null) {
          widget.valueChanged!(false);
        }
        _isHovered.value = false;
      },
        child: ValueListenableBuilder<bool>(
            valueListenable: _isHovered,
            builder: (context, value, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(widget.isLinkEnable)
                ...[
                AppImages.linkLogoSvg.toSvgImage(
                  color:  value ? widget.hoverColor : AppColors.whiteColor,
                  size: 14,
                ),
                const SizedBox(width: 6),
                ],
                Text(
                  widget.text,
                  style: TextStyle(
                    color: value ? widget.hoverColor : AppColors.primaryTextColor,
                    fontFamily: AppFont.font,
                    fontWeight: AppFont.semiBold,
                    fontSize: widget.textSize,
                    height: widget.height
                  ),
                ),
                if(widget.isArrowEnable)
                ...[
                  const SizedBox(width: 10),
                  AppImages.arrowUpRightSvg.toSvgImage(
                    color: value
                        ? AppColors.linkTextColor
                        : AppColors.whiteColor,
                    size: value ? 16 : 14,
                  ),
              ]
              ],
            );
          }
        ).toLaunchUrl(widget.url),
    );
  }
}
