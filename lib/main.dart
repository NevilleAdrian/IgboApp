import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/providers/provider_list.dart';
import 'package:nkuzi_igbo/screens/auth/login_screen.dart';
import 'package:nkuzi_igbo/screens/auth/password_reset_screen.dart';
import 'package:nkuzi_igbo/screens/auth/reset_screen.dart';
import 'package:nkuzi_igbo/screens/auth/reset_success.dart';
import 'package:nkuzi_igbo/screens/auth/signup_screen.dart';
import 'package:nkuzi_igbo/screens/auth/welcome_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/screens/registration_screen.dart';
import 'package:nkuzi_igbo/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'utils/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'NkuziIgbo',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        theme: myThemeData(context),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ResetScreen.id: (context) => ResetScreen(),
          PasswordResetScreen.id: (context) => PasswordResetScreen(),
          ResetSuccess.id: (context) => ResetSuccess(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomePage.id: (context) => HomePage(),
          SplashScreen.id: (context) => SplashScreen(),
        },
      ),
    );
  }
}
