import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/ui_widgets/network_image_cache.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

import '../option_box.dart';
import 'itest_manager.dart';

class MatchAndToEnglishLayout extends StatelessWidget {
  final ITestManager manager;
  final Test test;
  final bool isMatch;
  final Function onTap;
  final bool disable;
  final int selectedIndex;

  MatchAndToEnglishLayout(
      {this.test,
      this.onTap,
      this.disable,
      this.selectedIndex,
      this.isMatch,
      this.manager});

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
    final String optionA =
        isMatch ?? false ? test?.optionI ?? '' : test?.optionA ?? '';
    final String optionB =
        isMatch ?? false ? test?.optionIi ?? '' : test?.optionB ?? '';
    final String optionC =
        isMatch ?? false ? test?.optionIii ?? '' : test?.optionC ?? '';
    final String optionD =
        isMatch ?? false ? test?.optionIv ?? '' : test?.optionD ?? '';
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
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
                isMatch ?? false
                    ? DividerForMatch(
                        image: test?.matchQuestionImage,
                        question: test?.matchQuestion,
                      )
                    : DividerForEnglish(),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        runSpacing: 20,
                        spacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          ToEnglishOption(
                            showCorrect: shouldShowCorrectOption(optionA, 0),
                            isSelected: selectedIndex == 0,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(0, optionA),
                            option: optionA,
                          ),
                          ToEnglishOption(
                            showCorrect: shouldShowCorrectOption(optionB, 1),
                            isSelected: selectedIndex == 1,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(1, optionB),
                            option: optionB,
                          ),
                          ToEnglishOption(
                            showCorrect: shouldShowCorrectOption(optionC, 2),
                            isSelected: selectedIndex == 2,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(2, optionC),
                            option: optionC,
                          ),
                          ToEnglishOption(
                            showCorrect: shouldShowCorrectOption(optionD, 3),
                            isSelected: selectedIndex == 3,
                            onTap: disable
                                ? () {}
                                : () => changeSelectedIndex(3, optionD),
                            option: optionD,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

class DividerForEnglish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class DividerForMatch extends StatelessWidget {
  final String image;
  final String question;

  DividerForMatch({this.image, this.question});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFA0A0A0).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(-1, 1), // changes position of shadow
                ),
              ]),
          child: Column(
            children: <Widget>[
              AppNetworkImage(
                height: 100,
                image: image,
              ),
              if (!shouldShow(question))
                Text(
                  question ?? '',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        kAppDivider,
      ],
    );
  }
}
