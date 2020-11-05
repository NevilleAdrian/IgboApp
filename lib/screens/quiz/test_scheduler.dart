import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/screens/quiz/match_test.dart';
import 'package:nkuzi_igbo/screens/quiz/sentence_test.dart';
import 'package:nkuzi_igbo/screens/quiz/test_manager.dart';
import 'package:nkuzi_igbo/screens/quiz/to_english_test.dart';
import 'package:nkuzi_igbo/screens/quiz/to_igbo_test.dart';

class TestScheduler extends StatelessWidget {
  final Test test;
  final bool disable;
  final dynamic selectedIndex;
  final Function onTestTypeDone;

  TestScheduler(
      {this.test, this.onTestTypeDone, this.disable, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return getTestType(test.type);
  }

  Widget getTestType(String type) {
    switch (type) {
      case 'toEnglish':
        return ToEnglishTest(
          selectedIndex: selectedIndex,
          disable: disable ?? false,
          test: test,
          manager: TestManager(),
          onTap: onTestTypeDone,
        );
      case 'toIgbo':
        return ToIgboTest(
          selectedIndex: selectedIndex,
          disable: disable ?? false,
          test: test,
          manager: TestManager(),
          onTap: onTestTypeDone,
        );
      case 'match':
        return MatchTest(
          selectedIndex: selectedIndex,
          disable: disable ?? false,
          test: test,
          manager: TestManager(),
          onTap: onTestTypeDone,
        );
      case 'sentence':
        return SentenceTest(
          selectedOptions: selectedIndex,
          disable: disable ?? false,
          test: test,
          manager: TestManager(),
          onTap: onTestTypeDone,
        );
      default:
        return Container();
    }
  }
}
