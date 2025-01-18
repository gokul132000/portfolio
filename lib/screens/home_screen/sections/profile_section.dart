import 'package:flutter/material.dart';
import 'package:portfolio/utilities/enums.dart';
import 'package:portfolio/utilities/extension.dart';
import 'package:portfolio/utilities/globals.dart' as globals;
import 'package:provider/provider.dart';

import '../../../providers/home_provider/home_provider.dart';
import '../../../resource/app_colors.dart';
import '../../../resource/app_dimension.dart';
import '../../../resource/app_font.dart';
import '../../../resource/app_images.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_text.dart';

class SelfIntroSection extends StatelessWidget {
  final LayoutEnum layoutEnum;

  const SelfIntroSection({required this.layoutEnum, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: "Gokulram M.",
          size: layoutEnum == LayoutEnum.webLayout ? AppDimen.textSize46 : AppDimen.textSize36,
          weight: AppFont.bold,
        ),
        const SizedBox(height: 2),
        PrimaryText(
          text: "Flutter Developer",
          size: AppDimen.textSize20,
          weight: AppFont.semiBold,
        ),
        const SizedBox(height: 10),
        PrimaryText(
          text: "I build high-performing, cross-platform mobile and web applications with beautiful, responsive, and user-friendly designs.",
          size: AppDimen.textSize16,
          weight: AppFont.medium,
          color: AppColors.primaryLightTextColor,
        ),
        if (layoutEnum == LayoutEnum.webLayout) ...[
          const Spacer(),
          _navigationBar(provider),
          const Spacer(flex: 2),
        ] else
          const SizedBox(height: 20),
        _socialLinks(),
      ],
    );
  }

  Widget _navigationBar(HomeScreenProvider provider) {
    final List<Map<String, dynamic>> navigationItems = [
      {"text": "About", "index": 0},
      {"text": "Experience", "index": 1},
      {"text": "My Projects", "index": 2},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: navigationItems.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: PrimaryButton(
            isSelected: provider.currentIndex == item["index"],
            text: item["text"],
            onPressed: () => provider.scrollToSection(item["index"]),
          ),
        );
      }).toList(),
    );
  }

  Widget _socialLinks() {
    final List<Map<String, String>> socialIcons = [
      {
        "image": AppImages.githubLogoSvg,
        "link": globals.githubURL,
      },
      {
        "image": AppImages.linkedinLogoSvg,
        "link": globals.linkedInURL,
      },
      {
        "image": AppImages.gmailLogoSvg,
        "link": globals.emailURL,
      },
    ];

    return Row(
      children: socialIcons.map((icon) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child:  MouseRegion(
            cursor: SystemMouseCursors.click,
            child: icon["image"].toString().toSvgImage(
                color: AppColors.whiteColor,
                size: 20,
            ).toLaunchUrl(icon["link"].toString()),
          )
        );
      }).toList(),
    );
  }
  }




