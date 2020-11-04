import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nkuzi_igbo/models/study.dart';
import 'package:nkuzi_igbo/models/test.dart';
import 'package:nkuzi_igbo/screens/quiz/question_display.dart';
import 'package:nkuzi_igbo/screens/quiz/quiz_layout.dart';
import 'package:nkuzi_igbo/screens/quiz/test_scheduler.dart';
import 'package:nkuzi_igbo/ui_widgets/cache_helper.dart';
import 'package:nkuzi_igbo/ui_widgets/future_helper.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

enum StudyMode { Study, Test }

class QuizScreenPage extends StatefulWidget {
  static const String id = 'quiz_screen_page';
  final List<Study> studies;
  final String categoryName;
  QuizScreenPage({this.studies, this.categoryName});

  @override
  _QuizScreenPageState createState() => _QuizScreenPageState();
}

class _QuizScreenPageState extends State<QuizScreenPage>
    with SingleTickerProviderStateMixin {
  ///study is the learning while
  ///test is the quiz

  //the index of the current study
  int currentStudyIndex = 0;
  //the total studies available for study
  int totalStudiesCount = 0;
  //the current test index
  int currentTestIndex = 0;
  //total user score for the quiz
  int userScore = 0;
  //the option for the test that was selected
  dynamic selectedTestOptionIndex;

  ///The [studyMode] informs the application to
  ///show the right widgets for either study or test
  StudyMode studyMode = StudyMode.Study;
  List<Study> studies = [];
  AudioPlayer player = AudioPlayer();
  CacheManager cacheManager = CacheManager();

  Future<bool> futureAudios;
  Future<bool> futureTask(List<String> items) async {
    //download all audios
    await cacheManager.loadAllAssets(items);
    return Future.value(true);
  }

  //Controller for the animated icon button
  AnimationController _animationController;
  //check if the icon is playing
  bool isPlaying = false;
  //Check if the continue button for the quiz was selected.
  //We need to know this if we are to show correct/wrong or
  //move to the next test when the continue button is clicked
  bool quizContinueSelected = false;
  //this holds the very truth if the user's selection for a quiz
  //was correct
  bool currentStateOfUserChoice;

  //calculate the user's progress in term
  progressBar() {
    double figure = (currentStudyIndex + 1) / (widget.studies?.length ?? 10);
    return double.parse('${figure.toStringAsFixed(1)}');
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    studies = widget.studies;
    totalStudiesCount = studies.length;
    futureAudios = futureTask(studies
        .where((e) => !isNullOrEmpty(e.voicing))
        .map((e) => e.voicing)
        .toList());
    super.initState();
  }

  ///handle audio button clicked
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  //check if there are tests to be shown
  bool hasTests() {
    return studies[currentStudyIndex].test.length > 0;
  }

  //check if the study is done
  bool studyIsDone() {
    return currentStudyIndex == totalStudiesCount - 1;
  }

  //check if the test is done
  bool testIsDone() {
    Study currentStudy = studies[currentStudyIndex];
    bool result = currentTestIndex == (currentStudy?.test?.length ?? 0) - 1;
    print(
        'test done is $result, test index $currentTestIndex total tests ${currentStudy?.test?.length}');
    return result;
  }

  ///change the [studyMode] to the right mode
  void alternateMode(StudyMode mode) {
    studyMode = mode;
    if (mode == StudyMode.Test) {
      Study currentStudy = studies[currentStudyIndex];
      if (currentStudy != null) {
        List<String> items = currentStudy.test
            .where((e) => !isNullOrEmpty(e.audioUrl))
            .map((e) => e.audioUrl)
            .toList();
        futureAudios = futureTask(items);
      }
    }
  }

  //before alternating to study, check if an alternation can happen
  bool canAlternateToStudy() {
    print(totalStudiesCount);
    return currentStudyIndex + 1 <= totalStudiesCount - 1;
  }

  //we are done with the tests, hence we should reset all the values we
  //used for tracking except the user's score
  void resetTestValuesToDefault({Function callback}) {
    setState(() {
      quizContinueSelected = false;
      currentStateOfUserChoice = null;
      selectedTestOptionIndex = null;
      if (callback != null) callback();
    });
  }

  //advance to the next test available
  void incrementTestIndex({Function callback}) {
    if (!testIsDone()) {
      setState(() {
        currentTestIndex += 1;
        currentStateOfUserChoice = null;
        selectedTestOptionIndex = null;
        if (callback != null) callback();
      });
    } else {
      if (canAlternateToStudy()) {
        incrementStudyIndex(callback: () {
          alternateMode(StudyMode.Study);
          resetTestValuesToDefault();
        });
      } else {
        finalizeThisLesson();
      }
    }
  }

  //end of this module, send user's progress to the server
  //then return to the home page
  void finalizeThisLesson() {
    print('finalizing user score is $userScore');
  }

  //advance to the next study in line
  void incrementStudyIndex({Function callback}) {
    setState(() {
      if (!studyIsDone()) {
        currentStudyIndex += 1;
        if (callback != null) callback();
      } else {
        finalizeThisLesson();
      }
    });
  }

  //go back to the previous study
  void decreaseStudyIndex({Function callback}) {
    setState(() {
      if (currentStudyIndex > 0) {
        currentStudyIndex -= 1;
        if (callback != null) callback();
      }
    });
  }

  ///some study type have border around them or just an image
  ///these types are currently identified by their category name
  ///we made a constant for all category names satisfying this condition
  ///at [kIrregularStudies]
  bool _isRegular(String name) {
    print('name $name');
    return !isNullOrEmpty(name) &&
        !kIrregularStudies.contains(name.toLowerCase());
  }

  //the continue button for the quiz is tapped
  //show the user's status (correct/wrong) or advance to
  //a) the next test or
  //b) the next study or
  //c) finalize this module
  void _onQuizContinueTap() {
    if (currentStateOfUserChoice && quizContinueSelected) {
      userScore += 1;
    }
    if (quizContinueSelected) {
      incrementTestIndex(callback: () {
        quizContinueSelected = !quizContinueSelected;
        currentStateOfUserChoice = null;
      });
    } else {
      setState(() {
        quizContinueSelected = !quizContinueSelected;
      });
    }
  }

  void playCurrentStudyAudio() async {
    String audioUrl = getAppropriateAudio;
    if (!isNullOrEmpty(audioUrl)) {
      var currentFile = await cacheManager.loadAsset(audioUrl);
      print('path is ${currentFile?.file?.path}');
      if (currentFile != null) {
        await playAudio(currentFile.file.path);
      }
    }
  }

  String get getAppropriateAudio {
    if (studyMode == StudyMode.Study) {
      Study currentStudy = studies[currentStudyIndex];
      return currentStudy?.voicing;
    } else {
      Test test = studies[currentStudyIndex]?.test[currentTestIndex];
      return test?.audioUrl;
    }
  }

  Future<void> playAudio(String url) async {
    await player.setFilePath(url);
    player.setLoopMode(LoopMode.one);
    player.play();
  }

  void stopCurrentAudio() {
    if (player.playing) {
      player.stop();
    }
  }

  //T _cast<T>(dynamic data) => data is T ? data : null;

  ///change the user's correct state saved in [currentStateOfUserChoice]
  ///also set the index of the option selected to be that index identified by
  ///[selectedTestOptionIndex]
  void setTestStatus(bool result, dynamic index) {
    setState(() {
      currentStateOfUserChoice = result;
      selectedTestOptionIndex = index;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    player?.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('test is ${studies[currentStudyIndex].test}');
    print(widget.studies);
    Study currentStudy = studies[currentStudyIndex];
    print('picture is ${currentStudy.picture} made is $studyMode');
    return Scaffold(
      body: FutureHelper<bool>(
        task: futureAudios,
        actionWhenData: () {
          try {
            playCurrentStudyAudio();
          } catch (ex) {
            print('another error is $ex');
          }
        },
        builder: (context, _) => QuizLayout(
          progressWidth: progressBar(),
          progress: '${currentStudyIndex + 1}/$totalStudiesCount',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: AudioButton(
                  animationController: _animationController,
                  onPressed: _handleOnPressed,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: AnimatedCrossFade(
                        duration: Duration(milliseconds: 500),
                        crossFadeState: studyMode == StudyMode.Study
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: studyMode != StudyMode.Study
                            ? SizedBox()
                            : QuestionDisplay(
                                isRegular: _isRegular(widget.categoryName),
                                image: currentStudy.picture,
                                top: currentStudy.description,
                                bottom: currentStudy.igbo,
                              ),
                        secondChild: studyMode == StudyMode.Study
                            ? SizedBox()
                            : TestScheduler(
                                selectedIndex: selectedTestOptionIndex,
                                disable: quizContinueSelected,
                                onTestTypeDone: setTestStatus,
                                test: studies[currentStudyIndex]
                                    .test[currentTestIndex],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          footer: AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            crossFadeState: studyMode == StudyMode.Study
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: LearnFooter(
                onMoveBack: () async {
                  await stopCurrentAudio();
                  decreaseStudyIndex(callback: () async {
                    await playCurrentStudyAudio();
                  });
                },
                onMoveNext: () async {
                  await stopCurrentAudio();
                  if (hasTests()) {
                    resetTestValuesToDefault(callback: () {
                      alternateMode(StudyMode.Test);
                    });
                  } else {
                    incrementStudyIndex(callback: () async {
                      await playCurrentStudyAudio();
                    });
                  }
                },
              ),
            ),
            secondChild: StudyFooter(
              isCorrect: currentStateOfUserChoice,
              isSelected: quizContinueSelected,
              onPressed: _onQuizContinueTap,
            ),
          ),
        ),
      ),
    );
  }
}

class LearnFooter extends StatelessWidget {
  final Function onMoveNext;
  final Function onMoveBack;

  const LearnFooter({this.onMoveNext, this.onMoveBack});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LearnDirection(
          iconData: Icons.chevron_left,
          onPressed: onMoveBack,
        ),
        LearnDirection(
          iconData: Icons.chevron_right,
          onPressed: onMoveNext,
        ),
      ],
    );
  }
}

class LearnDirection extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  LearnDirection({
    @required this.iconData,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, sizeInfo) {
      print('height ${sizeInfo.maxHeight}');
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: kAppCircle,
          color: Color(0xFFF21600),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          color: Colors.white,
          icon: Icon(
            iconData,
            size: 30,
          ),
          onPressed: onPressed,
        ),
      );
    });
  }
}

class StudyFooter extends StatelessWidget {
  final bool isCorrect;
  final Function onPressed;
  final bool isSelected;
  StudyFooter({this.isCorrect, this.isSelected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    final bool selected = isSelected ?? false;
    final bool correct = isCorrect ?? false;
    final Color color =
        correct ? Color(0xFF66C109).withOpacity(0.04) : Color(0xFFFFF5EB);
    final buttonColor = correct ? Color(0xFF66C109) : Color(0xFFF21600);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 20.0, top: selected ? 20.0 : 0),
      color: selected ? color : Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            crossFadeState:
                selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Column(
              children: [
                AnswerStatus(
                  isCorrect: correct,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            secondChild: SizedBox(),
          ),
          AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            crossFadeState:
                selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: FlatButton(
              disabledColor: Color(0xFFC71200),
              minWidth: double.infinity,
              color: buttonColor,
              onPressed: isCorrect == null ? null : onPressed,
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
            secondChild: FlatButton(
              disabledColor: Color(0xFFC71200),
              minWidth: double.infinity,
              color: Color(0xFFF21600),
              onPressed: isCorrect == null ? null : onPressed,
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AnswerStatus extends StatelessWidget {
  final bool isCorrect;

  AnswerStatus({this.isCorrect});
  @override
  Widget build(BuildContext context) {
    final bool correct = isCorrect ?? false;
    return Row(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: kAppCircle,
            border: Border.all(
              color: correct ? Color(0xFF4C9800) : Color(0xFF9D1000),
            ),
            color: correct ? Color(0xFF66C109) : Color(0xFFF21600),
          ),
          child: Icon(
            correct ? Icons.check : Icons.clear,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            correct ? 'Correct Answer' : 'Wrong Answer',
            style: TextStyle(
              color: correct ? Color(0xFF66C109) : Color(0xFFF21600),
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class AudioButton extends StatelessWidget {
  final AnimationController animationController;
  final Function onPressed;
  AudioButton({@required this.animationController, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        borderRadius: kAppCircle,
        gradient:
            LinearGradient(colors: [Color(0xFFF7B500), Color(0xFFF48C02)]),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        icon: AnimatedIcon(
          icon: AnimatedIcons.pause_play,
          progress: animationController,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
