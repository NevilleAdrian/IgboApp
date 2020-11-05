import 'package:nkuzi_igbo/screens/quiz/itest_manager.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

class TestManager extends ITestManager {
  static TestManager _manager;
  static TestManager get instance =>
      _manager == null ? TestManager() : _manager;
  double _points;
  @override
  bool checkAnswer({String correctOption, String userOption}) {
    return !isNullOrEmpty(correctOption) &&
        !isNullOrEmpty(userOption) &&
        correctOption.toLowerCase() == userOption.toLowerCase();
  }

  @override
  double get points => _points;
}
