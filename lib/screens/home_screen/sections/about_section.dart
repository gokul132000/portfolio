import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_dimension.dart';

import '../../../resource/app_colors.dart';
import '../../../resource/app_font.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/globals.dart' as globals;
import '../../../widgets/hover_text.dart';

class AboutSection extends StatelessWidget {
  final LayoutEnum layoutEnum;

  const AboutSection({super.key, required this.layoutEnum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: layoutEnum == LayoutEnum.webLayout ? 80.0 : 0.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: AppDimen.textSize16,
            color: AppColors.primaryLightTextColor,
            height: 1.5,
            fontWeight: AppFont.regular,
            fontFamily: AppFont.font,
          ),
          children: [
            TextSpan(text: "I’m a developer passionate about crafting accessible, pixel-perfect user interfaces that blend thoughtful design with robust engineering. "
                "My favorite work lies at the intersection of design and development, creating experiences that not only look great but are meticulously built for performance and usability.\n\n"),
            TextSpan(text: "Previously, I worked as a "),
            WidgetSpan(
              child: HoverText(
                text: "Flutter Developer",
                url: globals.flutterOfficialSite,
                height: 1.5,
              ),
            ),
            TextSpan(text: " at "),
            WidgetSpan(
              child: HoverText(
                text: "RadicalStart InfoLab Pvt Ltd",
                url: globals.radicalOfficialSite,
                height: 1.5,
              ),
            ),
            TextSpan(
              text: ", where I specialized in building scalable and high-performance mobile applications. "
                  "I contributed to the development and maintenance of UI components, ensuring seamless, user-friendly experiences. "
                  "I have expertise in Flutter, Dart, Bloc, GetX, Provider, REST APIs, GraphQL, Firebase, and Socket.IO, while also ensuring performance optimizations and accessibility compliance.\n\n",
            ),
            TextSpan(text: "Throughout my career, I’ve focused on delivering high-quality, scalable applications that meet both user needs and technical requirements. I am passionate about engineering solutions that are both intuitive and efficient.\n\n"),
            TextSpan(text: "Outside of development, I enjoy exploring new technologies and reading. "
                "When I'm not coding, you can find me experimenting with new app ideas, catching up on tech trends, or simply enjoying a great book."),
          ],
        ),
      ),
    );
  }
}


