import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/home_provider/home_provider.dart';
import 'package:portfolio/utilities/extension.dart';
import 'package:portfolio/widgets/custom_chip.dart';
import 'package:portfolio/widgets/hover_text.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/utilities/globals.dart' as globals;
import '../../../resource/app_colors.dart';
import '../../../resource/app_dimension.dart';
import '../../../resource/app_font.dart';
import '../../../utilities/enums.dart';
import '../../../widgets/portfolio_logo.dart';
import '../../../widgets/primary_text.dart';

class ProjectsSection extends StatelessWidget {
  final LayoutEnum layoutEnum;

  const ProjectsSection({super.key, required this.layoutEnum});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: layoutEnum == LayoutEnum.webLayout ? 80.0 : 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...provider.projectDetailsList.asMap().entries.map((entry) {
            return ProjectCard(
              index: entry.key,
              layoutEnum: layoutEnum,
            );
          }),
          const SizedBox(height: 100.0),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: AppDimen.textSize14,
                color: AppColors.primaryLightTextColor,
                height: 1.5,
                fontWeight: AppFont.regular,
                fontFamily: AppFont.font,
              ),
              children: [
                TextSpan(text: "Designed with inspiration from various references and meticulously developed in "),
                WidgetSpan(
                  child: HoverText(
                    text: "Android Studio",
                    url: globals.androidStudioOfficialURL,
                    height: 1.5,
                    textSize: AppDimen.textSize12,
                  ),
                ),
                TextSpan(text: "."),
                TextSpan(text: " Built using the "),
                WidgetSpan(
                  child: HoverText(
                    text: "Flutter framework",
                    url: globals.flutterOfficialSite,
                    height: 1.5,
                    textSize: AppDimen.textSize12,
                  ),
                ),
                TextSpan(text: " and deployed on "),
                WidgetSpan(
                  child: HoverText(
                    text: "GitHub",
                    url: globals.githubURL,
                    height: 1.5,
                    textSize: AppDimen.textSize12,
                  ),
                ),
                TextSpan(text: "."),
              ],
            ),
          ),
          const SizedBox(height: 70.0),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final int index;
  final LayoutEnum layoutEnum;

  const ProjectCard({super.key, required this.index, required this.layoutEnum});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        final project = provider.projectDetailsList[index];
        final isHovered = provider.projectHoverIndex == index;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => provider.projectSetHoverIndex(index),
          onExit: (_) => provider.projectSetHoverIndex(-1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: isHovered ? AppColors.selectionColor  : null,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: (layoutEnum == LayoutEnum.mobileLayout && !kIsWeb) ? const EdgeInsets.only(bottom: 20.0) : const EdgeInsets.all(25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (layoutEnum == LayoutEnum.webLayout) ...[
                    PortfolioLogo(
                      appName: project["title"],
                      isHover: isHovered,
                    ),
                    const SizedBox(width: 15),
                  ],
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HoverText(
                          text: project["title"],
                          url: project["redirectionLink"],
                          isArrowEnable: true,
                          isHoverEnable: isHovered && !provider.isOverAllRedirection,
                        ),
                        const SizedBox(height: 12),
                        PrimaryText(
                          text: project["description"],
                          size: AppDimen.textSize14,
                          color: AppColors.primaryLightTextColor,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: project["link"].entries.map<Widget>((entry) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.only(end: 12.0),
                              child: HoverText(
                                text: entry.key,
                                url: entry.value,
                                isLinkEnable: true,
                                textSize: AppDimen.textSize14,
                                valueChanged: (value){
                                  provider.overAllRedirection(value);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 5.0),
                        Wrap(
                          children: project["technology"]
                              .map<Widget>((tech) => CustomChip(text: tech))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).toLaunchUrl(project["redirectionLink"]),
        );
      },
    );
  }
}









