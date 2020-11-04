import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/screens/quiz/match_and_to_english_layout.dart';

import '../option_box.dart';
import 'itest_manager.dart';

class ToEnglishTest extends StatelessWidget {
  final ITestManager manager;
  final Test test;
  final Function onTap;
  final bool disable;
  final int selectedIndex;

  ToEnglishTest(
      {this.manager, this.test, this.onTap, this.disable, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    print('should disable $disable $selectedIndex');
    return MatchAndToEnglishLayout(
      manager: manager,
      test: test,
      onTap: onTap,
      disable: disable,
      selectedIndex: selectedIndex,
      isMatch: false,
    );
  }
}
