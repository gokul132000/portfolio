import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_colors.dart';
import 'package:portfolio/resource/app_dimension.dart';
import 'package:portfolio/resource/app_font.dart';
import 'package:portfolio/utilities/extension.dart';
import 'package:portfolio/widgets/custom_chip.dart';
import 'package:portfolio/widgets/hover_text.dart';
import 'package:portfolio/widgets/primary_text.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_provider/home_provider.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/globals.dart' as globals;

class ExperienceSection extends StatelessWidget {
  final LayoutEnum layoutEnum;

  const ExperienceSection({super.key, required this.layoutEnum});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: layoutEnum == LayoutEnum.webLayout ? 80.0 : 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...provider.experienceDetailsList.asMap().entries.map((entry) {
            return ExperienceCard(
              index: entry.key,
              layoutEnum: layoutEnum,
            );
          }),
          const SizedBox(height: 20),
          HoverText(
            text: "View Full Resume",
            url: globals.resumeLink,
            isArrowEnable: true,
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final int index;
  final LayoutEnum layoutEnum;

  const ExperienceCard({super.key, required this.index, required this.layoutEnum});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        final experience = provider.experienceDetailsList[index];
        final isHovered = provider.hoverIndex == index;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => provider.setHoverIndexForExperience(index),
          onExit: (_) => provider.setHoverIndexForExperience(-1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: isHovered && layoutEnum != LayoutEnum.mobileLayout ? const Color(0xFF1A2338) : null,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: (layoutEnum == LayoutEnum.mobileLayout) ? null : const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _experienceWidgetList(context, provider, experience, isHovered),
              ),
            ).toLaunchUrl(experience["redirectionLink"]),
        );
      },
    );
  }

  List<Widget> _experienceWidgetList(
      BuildContext context,
      HomeScreenProvider provider,
      Map<String, dynamic> experience,
      bool isHovered,
      ) {
    return [
      if (layoutEnum == LayoutEnum.webLayout) ...[
        PrimaryText(
          text: experience["years"],
          color: AppColors.primaryLightTextColor,
          size: AppDimen.textSize14,
          weight: AppFont.medium,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.025),
      ],
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (layoutEnum == LayoutEnum.mobileLayout)
              PrimaryText(
                text: experience["years"],
                color: AppColors.primaryLightTextColor,
                size: AppDimen.textSize14,
                weight: AppFont.medium,
              ),
            FittedBox(
              child: HoverText(
                text: "${experience["role"]} \u2022 ${experience["companyName"]}",
                url: experience["redirectionLink"],
                isArrowEnable: true,
                isHoverEnable: isHovered,
              ),
            ),
            const SizedBox(height: 10),
            PrimaryText(
              text: experience["description"],
              size: AppDimen.textSize14,
              color: AppColors.primaryLightTextColor,
              weight: AppFont.regular,
            ),
            const SizedBox(height: 10),
            Wrap(
              children: experience["skills"]
                  .map<Widget>((skill) => CustomChip(text: skill))
                  .toList(),
            ),
          ],
        ),
      ),
    ];
  }
}






