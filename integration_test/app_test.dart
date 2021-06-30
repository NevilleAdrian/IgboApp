import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nkuzi_igbo/main.dart' as app;
import 'package:nkuzi_igbo/screens/auth/signup_screen.dart' as signUp;
import 'package:nkuzi_igbo/screens/auth/welcome_screen.dart' as welcome;
import 'package:nkuzi_igbo/screens/splash_screen.dart' as splash;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "App Flow test.",
    (WidgetTester tester) async {
      // Testing starts at the root widget in the widget tree
      app.main();
      await tester.pumpAndSettle();

      //load the splashscreen
      splash.SplashScreen();
      await tester.pumpAndSettle();

      //if there's no token load the welcome screen
      welcome.WelcomeScreen();
      await tester.pumpAndSettle();

      //click on signUp to open sign up screen
      await tester.tap((find.byType(RaisedButton)));
      await tester.pumpAndSettle();

      signUp.SignUpScreen();
      await tester.pumpAndSettle();

      //Fill Sign up form
      final nameFormField = find.byKey(Key('name'));
      final emailFormField = find.byKey(Key('email'));
      final passwordFormField = find.byKey(Key('password'));
      final signUpButton = find.byType(FlatButton).last;

      await tester.enterText(nameFormField, "John");
      await tester.enterText(emailFormField, "john1980@gmail.com");
      await tester.enterText(passwordFormField, 'Password1234\$');

      //Go to the homepage
      await tester.tap(signUpButton);
    },
  );
}
