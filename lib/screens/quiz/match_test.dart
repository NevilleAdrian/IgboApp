import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/models/test.dart';

import 'itest_manager.dart';
import 'match_and_to_english_layout.dart';

class MatchTest extends StatelessWidget {
  final ITestManager manager;
  final Test test;
  final Function onTap;
  final bool disable;
  final int selectedIndex;

  MatchTest(
      {this.manager, this.test, this.onTap, this.disable, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return MatchAndToEnglishLayout(
      manager: manager,
      test: test,
      onTap: onTap,
      disable: disable,
      selectedIndex: selectedIndex,
      isMatch: true,
    );
  }
}
