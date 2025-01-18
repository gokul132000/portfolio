import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringOpertion on String {
  Widget toSvgImage({Color? color,double? size}){
    return SvgPicture.asset(
      this,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      height: size,
      width: size,
    );
  }
}

extension WidgetOperation on Widget {
  Widget toLaunchUrl(String url) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication),
      child: this,
    );
  }
}