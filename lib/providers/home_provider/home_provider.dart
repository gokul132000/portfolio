import 'package:flutter/material.dart';

import 'mixins/experience_mixin.dart';
import 'mixins/projects_mixin.dart';

class HomeScreenProvider extends ChangeNotifier with ExperienceMixin, ProjectsMixin{
  FocusNode focusNode = FocusNode();
  int currentIndex = 0;
  final ScrollController scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  GlobalKey get aboutKey => _aboutKey;
  GlobalKey get experienceKey => _experienceKey;
  GlobalKey get projectsKey => _projectsKey;

  HomeScreenProvider() {
    scrollController.addListener(_updateCurrentSection);
  }

  void _updateCurrentSection() {
    final aboutBox = _aboutKey.currentContext?.findRenderObject() as RenderBox?;
    final experienceBox = _experienceKey.currentContext?.findRenderObject() as RenderBox?;
    final projectsBox = _projectsKey.currentContext?.findRenderObject() as RenderBox?;

    final scrollOffset = scrollController.offset;

    if (aboutBox != null && _isSectionVisible(aboutBox, scrollOffset)) {
      if (currentIndex != 0) {
        currentIndex = 0;
        notifyListeners();
      }
    } else if (experienceBox != null && _isSectionVisible(experienceBox, scrollOffset)) {
      if (currentIndex != 1) {
        currentIndex = 1;
        notifyListeners();
      }
    } else if (projectsBox != null && _isSectionVisible(projectsBox, scrollOffset)) {
      if (currentIndex != 2) {
        currentIndex = 2;
        notifyListeners();
      }
    }
  }

  bool _isSectionVisible(RenderBox box, double scrollOffset) {
    final position = box.localToGlobal(Offset.zero).dy - scrollOffset;
    final viewportHeight = MediaQuery.of(_aboutKey.currentContext!).size.height;
    return position < viewportHeight && position + box.size.height > 0;
  }

  void scrollToSection(int index) {
    currentIndex = index;
    if (index == 0) {
      Scrollable.ensureVisible(_aboutKey.currentContext!);
    } else if (index == 1) {
      Scrollable.ensureVisible(_experienceKey.currentContext!);
    } else if (index == 2) {
      Scrollable.ensureVisible(_projectsKey.currentContext!);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateCurrentSection);
    scrollController.dispose();
    super.dispose();
  }
}
