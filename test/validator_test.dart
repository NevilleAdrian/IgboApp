import 'package:flutter_test/flutter_test.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

void main() {
  test('email is not valid', () {
    final email = 'neville.chukumah@gmail.com';
    expect(isEmailValid(email), true);
  });
}
