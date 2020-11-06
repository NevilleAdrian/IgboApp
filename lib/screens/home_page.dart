import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:nkuzi_igbo/screens/home_screen.dart';
import 'package:nkuzi_igbo/screens/notifications_screen.dart';
import 'package:nkuzi_igbo/screens/profile_screen.dart';
import 'package:nkuzi_igbo/screens/progress_screen.dart';
import 'package:flutter/services.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'dart:io' show Platform;

import 'home_screen_slivers.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _deviceToken = 'Loading...';
  String _instruction = '(please wait)';
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    ProgressScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    // Start the Pushy service
    Pushy.listen();

    // Request the WRITE_EXTERNAL_STORAGE permission on Android so that the Pushy SDK will be able to persist the device token in the external storage
    Pushy.requestStoragePermission();

    // Set custom notification icon (Android)
    Pushy.setNotificationIcon('ic_notify');

    try {
      // Register the device for push notifications
      String deviceToken = await Pushy.register();

      // Print token to console/logcat
      print('Device token: $deviceToken');

      // Send the token to your backend server
      // ...

      // Update UI with token
      setState(() {
        _deviceToken = deviceToken;
        _instruction =
            Platform.isAndroid ? '(copy from logcat)' : '(copy from console)';
      });
    } on PlatformException catch (error) {
      // Print to console/logcat
      print('Error: ${error.message}');

      // Show error
      setState(() {
        _deviceToken = 'Registration failed';
        _instruction = '(restart app to try again)';
      });
    }

    // Listen for push notifications received
    Pushy.setNotificationListener((Map<String, dynamic> data) {
      // Print notification payload data
      print('Received notification: $data');

      // Clear iOS app badge number
      Pushy.clearBadge();

      // Extract notification messsage
      String message = data['message'] ?? 'Hello World!';
      print('mess: $message');
      // Display an alert with the "message" payload value
      Flushbar(
        titleText: Row(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 15.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Welcome',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        messageText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nkuzi Igbo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        duration: Duration(seconds: 6),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0XFF9D1000),
        flushbarStyle: FlushbarStyle.GROUNDED,
        // margin: EdgeInsets.all(8),
        borderRadius: 8,
        // onTap: np.action,
      )..show(context);
//      showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return
//          AlertDialog(
//              title: Text('Pushy'),
//              content: Text(message),
//              actions: [
//                FlatButton(
//                  child: Text('OK'),
//                  onPressed: () {
//                    Navigator.of(context, rootNavigator: true).pop('dialog');
//                  },
//                )
//              ]);
//
//        },
//      );
    });

    // Listen for push notification clicked
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
      // Print notification payload data
      print('Notification clicked: $data');

      // Extract notification messsage
      String message = data['message'] ?? 'Hello World!';

      // Display an alert with the "message" payload value
      Flushbar(
        titleText: Row(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 15.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Welcome',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        messageText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nkuzi Igbo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        duration: Duration(seconds: 6),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.white,
        flushbarStyle: FlushbarStyle.GROUNDED,
        // margin: EdgeInsets.all(8),
        borderRadius: 8,
        // onTap: np.action,
      )..show(context);

      // Clear iOS app badge number
      Pushy.clearBadge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/learn.svg",
                color: _selectedIndex == 0
                    ? Color(0XFFF48C02)
                    : Color(0XFF9A9A9A)),
            title: Text('Learn',
                style: TextStyle(
                    fontSize: 13.0,
                    color: _selectedIndex == 0
                        ? Color(0XFF9D1000)
                        : Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/progress.svg",
                color: _selectedIndex == 1
                    ? Color(0XFFF48C02)
                    : Color(0XFF9A9A9A)),
            title: Text('Progress',
                style: TextStyle(
                    fontSize: 13.0,
                    color: _selectedIndex == 1
                        ? Color(0XFF9D1000)
                        : Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/notification.svg",
                color: _selectedIndex == 2
                    ? Color(0XFFF48C02)
                    : Color(0XFF9A9A9A)),
            title: Text('Notifications',
                style: TextStyle(
                    fontSize: 13.0,
                    color: _selectedIndex == 2
                        ? Color(0XFF9D1000)
                        : Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile.svg",
                color: _selectedIndex == 3
                    ? Color(0XFFF48C02)
                    : Color(0XFF9A9A9A)),
            title: Text('Profile',
                style: TextStyle(
                    fontSize: 13.0,
                    color: _selectedIndex == 3
                        ? Color(0XFF9D1000)
                        : Color(0XFF9A9A9A))),
          ),
        ],
      ),
    );
  }
}
