import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/utils/functions.dart';
import '../option_box.dart';
import 'itest_manager.dart';

class SentenceTest extends StatelessWidget {
  final ITestManager manager;
  final Test test;
  final bool isMatch;
  final Function onTap;
  final bool disable;
  final List<String> selectedOptions;

  const SentenceTest(
      {this.manager,
      this.test,
      this.isMatch,
      this.onTap,
      this.disable,
      this.selectedOptions});

  bool correctAnswer(String userOption) {
    List<String> correctSentence = test?.correctSentence ?? [];
    return manager.checkAnswer(
      correctOption: correctSentence.map((e) => e.toLowerCase()).join(','),
      userOption: userOption,
    );
  }

  void addSelectedIndex(String option) {
    List<String> newOptions = selectedOptions ?? [];
    if (!newOptions.contains(option) && !isNullOrEmpty(option))
      newOptions.add(option);
    onTap(correctAnswer(newOptions.map((e) => e.toLowerCase()).join(',')),
        newOptions);
  }

  void removeSelectedIndex(String option) {
    List<String> newOptions = selectedOptions ?? [];
    if (newOptions.contains(option) && !isNullOrEmpty(option))
      newOptions.remove(option);
    onTap(correctAnswer(option), newOptions);
  }

  @override
  Widget build(BuildContext context) {
    final options = selectedOptions ?? [];
    return Column(
      children: <Widget>[
        HtmlWidget(
          test?.question ?? '',
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFFF7B500),
                    spreadRadius: 1,
                    blurRadius: 0,
                  ),
                ]),
            child: Column(
              children: <Widget>[
                HtmlWidget(
                  test?.mainQuestion,
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                )
              ],
            )),
        SizedBox(
          height: 30.0,
        ),
        Container(color: Colors.grey, height: 0.3),
        SizedBox(
          height: 20.0,
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 20.0,
          children: <Widget>[
            ...options.map((word) {
              int index = options.indexOf(word);
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: GestureDetector(
                  onTap: disable
                      ? () {}
                      : () {
                          removeSelectedIndex(word);
                        },
                  child: OptionBox(
                    option: word,
                    gradient1: Colors.white,
                    gradient2: Colors.white,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(color: Colors.grey, height: 0.3),
        SizedBox(
          height: 30.0,
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 20.0,
          children: <Widget>[
            ...test.words.map((word) {
              int index = test.words.indexOf(word);
              return SentenceBox(
                onTap: () => addSelectedIndex(word),
                word: word,
                isSelected: options.contains(word),
              );
            }).toList(),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class SentenceBox extends StatelessWidget {
  final Function onTap;
  final String word;
  final bool isSelected;
  const SentenceBox({this.onTap, this.word, this.isSelected});
  @override
  Widget build(BuildContext context) {
    final bool selected = isSelected;
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: OptionBox(
          option: word,
          gradient1: selected ? Color(0XFFF7F7F7) : Colors.white,
          gradient2: selected ? Color(0XFFF7F7F7) : Colors.white,
          color: Colors.white,
          fontColor: selected ? Colors.transparent : Colors.black,
        ),
      ),
    );
  }
}
