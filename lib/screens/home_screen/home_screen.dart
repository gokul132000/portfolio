import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/screens/home_screen/sections/profile_section.dart';
import '../../providers/home_provider/home_provider.dart';
import '../../utilities/enums.dart';
import '../../widgets/primary_scaffold.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/sticky_header.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
          return PrimaryScaffold(
            body: ResponsiveLayout(
              mobileLayoutWidget: _mobileLayoutWidget(
                  context: context,
                  layoutEnum: LayoutEnum.mobileLayout,
                  provider: provider,
              ),
              webLayoutWidget: _webLayoutWidget(
                context: context,
                layoutEnum: LayoutEnum.webLayout,
                provider: provider,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mobileLayoutWidget({required BuildContext context, required HomeScreenProvider provider, required LayoutEnum layoutEnum}) {
    Map<String,Widget> map = {
      "Self Intro": SelfIntroSection(layoutEnum: layoutEnum,),
      "About": AboutSection(layoutEnum: layoutEnum,),
      "Experience": ExperienceSection(layoutEnum: layoutEnum,),
      "My Projects": ProjectsSection(layoutEnum: layoutEnum,),
    };

    return KeyboardListener(
      focusNode: provider.focusNode,
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        _keyBoardScrollController(
            provider: provider,
            event: event
        );
      },
      child: CustomScrollView(
        controller: provider.scrollController,
        slivers: List.generate(
          map.length,
              (index) {
            String sectionTitle = map.keys.elementAt(index);
            Widget sectionWidget = map.values.elementAt(index);
            return StickyHeader(index: index, title: sectionTitle, child: sectionWidget);
          },
        ),
        reverse: false,
      ),
    );
  }

  Widget _webLayoutWidget({required BuildContext context, required HomeScreenProvider provider, required LayoutEnum layoutEnum}) {
    return Row(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 80.0, top: 100.0, bottom: 100.0),
              child: SelfIntroSection(layoutEnum: layoutEnum,),
            ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _scrollIncrementally(up: true, context: context, provider: provider);
                },
                child: Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.arrow_drop_up_outlined,
                    color: Colors.grey,
                    size: 19,
                  ),
                ),
              ),
              Expanded(
                child: KeyboardListener(
                  focusNode: provider.focusNode,
                  autofocus: true,
                  onKeyEvent: (KeyEvent event) {
                    _keyBoardScrollController(
                        provider: provider,
                        event: event
                    );
                  },
                  child: Scrollbar(
                    thickness: 15,
                    thumbVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    trackVisibility: true,
                    interactive: true,
                    radius: Radius.zero,
                    controller: provider.scrollController,
                    child: SingleChildScrollView(
                      controller: provider.scrollController,
                      child: Container(
                        padding: const EdgeInsetsDirectional.only(end: 80.0, start: 200.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AboutSection(key: provider.aboutKey,layoutEnum: layoutEnum,),
                            ExperienceSection(key: provider.experienceKey,layoutEnum: layoutEnum,),
                            ProjectsSection(key: provider.projectsKey,layoutEnum: layoutEnum,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _scrollIncrementally(up: false, context: context, provider: provider);
                },
                child: Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                    size: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _scrollIncrementally({required bool up, required BuildContext context, required HomeScreenProvider provider}) {
    final currentOffset = provider.scrollController.offset;
    final viewportHeight = MediaQuery.of(context).size.height;

    final newOffset = up
        ? (currentOffset - viewportHeight * 0.5).clamp(0.0, provider.scrollController.position.maxScrollExtent)
        : (currentOffset + viewportHeight * 0.5).clamp(0.0, provider.scrollController.position.maxScrollExtent);

    provider.scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _keyBoardScrollController({required HomeScreenProvider provider,required KeyEvent event}){
    double currentScrollPosition = provider.scrollController.position.pixels;
    double maxScroll = provider.scrollController.position.maxScrollExtent;
    double minScroll = provider.scrollController.position.minScrollExtent;
    if (event.logicalKey == LogicalKeyboardKey.arrowDown && currentScrollPosition < maxScroll) {
      provider.scrollController.jumpTo(currentScrollPosition + 50);
    }
    else if (event.logicalKey == LogicalKeyboardKey.arrowUp && currentScrollPosition > minScroll) {
      provider.scrollController.jumpTo(currentScrollPosition - 50);
    }
  }
}



