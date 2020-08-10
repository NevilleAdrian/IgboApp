import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/screens/home_screen.dart';
import 'package:nkuzi_igbo/screens/login_screen.dart';
import 'package:nkuzi_igbo/screens/registration_screen.dart';
import 'package:nkuzi_igbo/screens/splash_screen.dart';
import 'package:nkuzi_igbo/screens/welcome_screen.dart';

import 'utils/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NkuziIgbo',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      theme: myThemeData(context),
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        HomePage.id : (context) => HomePage(),
        SplashScreen.id : (context) => SplashScreen()
      },
    );
  }
}

