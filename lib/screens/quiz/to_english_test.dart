import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/models/test.dart';

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

  bool correctAnswer(String userOption) {
    return manager.checkAnswer(
      correctOption: test?.correctOption,
      userOption: userOption,
    );
  }

  void changeSelectedIndex(int index, String userOption) {
    onTap(correctAnswer(userOption), index);
  }

  bool shouldShowCorrectOption(String userOption, int currentIndex) {
    return disable &&
        correctAnswer(userOption) &&
        selectedIndex != currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    print('should disable $disable $selectedIndex');
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: HtmlWidget(
                  test?.question ?? '',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.grey, height: 0.3),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                        'in Igbo',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ))),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.grey, height: 0.3),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Column(
                children: <Widget>[
                  Wrap(
                    runSpacing: 20,
                    spacing: 10,
                    alignment: WrapAlignment.spaceEvenly,
                    children: <Widget>[
                      ToEnglishOption(
                        showCorrect: shouldShowCorrectOption(test?.option1, 0),
                        isSelected: selectedIndex == 0,
                        onTap: disable
                            ? () {}
                            : () => changeSelectedIndex(0, test?.option1),
                        option: test?.option1 ?? '',
                      ),
                      ToEnglishOption(
                        showCorrect: shouldShowCorrectOption(test?.option2, 1),
                        isSelected: selectedIndex == 1,
                        onTap: disable
                            ? () {}
                            : () => changeSelectedIndex(1, test?.option2),
                        option: test?.option2 ?? '',
                      ),
                      ToEnglishOption(
                        showCorrect: shouldShowCorrectOption(test?.option3, 2),
                        isSelected: selectedIndex == 2,
                        onTap: disable
                            ? () {}
                            : () => changeSelectedIndex(2, test?.option3),
                        option: test?.option3 ?? '',
                      ),
                      ToEnglishOption(
                        showCorrect: shouldShowCorrectOption(test?.option4, 3),
                        isSelected: selectedIndex == 3,
                        onTap: disable
                            ? () {}
                            : () => changeSelectedIndex(3, test?.option4),
                        option: test?.option4 ?? '',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ToEnglishOption extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  final String option;
  final bool showCorrect;

  Color get _optionGradientOneColor {
    if (showCorrect) return Colors.green;
    if (isSelected) return Color(0XFFF7B500);
    return Colors.white;
  }

  Color get _optionGradientTwoColor {
    if (showCorrect) return Color(0xFF66C109);
    if (isSelected) return Color(0XFFF48C02);
    return Colors.white;
  }

  Color get _optionFontColor {
    if (showCorrect || isSelected) return Colors.white;
    return Colors.black;
  }

  ToEnglishOption({this.onTap, this.isSelected, this.option, this.showCorrect});
  @override
  Widget build(BuildContext context) {
    print('is selected $isSelected and showCorrect $showCorrect');
    return GestureDetector(
      onTap: onTap,
      child: OptionBox(
        option: option ?? '',
        gradient1: _optionGradientOneColor,
        gradient2: _optionGradientTwoColor,
        fontColor: _optionFontColor,
      ),
    );
  }
}
