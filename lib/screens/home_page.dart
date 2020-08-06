
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/screens/home_screen.dart';
import 'package:nkuzi_igbo/screens/notifications_screen.dart';
import 'package:nkuzi_igbo/screens/profile_screen.dart';
import 'package:nkuzi_igbo/screens/progress_screen.dart';
class HomePage extends StatefulWidget {

  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> _screens = [
   HomeScreen(),
    ProgressScreen(),
    NotificationScreen(),
    ProfileScreen()
  ] ;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  void _onTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
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
        backgroundColor: Colors.white ,
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
//            icon: SvgPicture.asset("assets/images/appointments.svg",
//              color: _selectedIndex == 0 ? Color(0XFFFF7B71): Colors.black,
//            ),
            icon: Icon(Icons.book),
            title: Text('Learn', style: TextStyle(color: Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
//            icon: SvgPicture.asset("assets/images/Icons_5.svg",
//              color: _selectedIndex == 1 ? Color(0XFFFF7B71): Colors.black,
//            ),
            icon: Icon(Icons.table_chart),
            title: Text('Progress', style: TextStyle(color: Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
//            icon: BadgeOnWidget(
//              number: (notifCount == 0) ? null : notifCount.toString(),
//              child: SvgPicture.asset("assets/images/Icons_4.svg",
//                color: _selectedIndex == 2 ? Color(0XFFFF7B71): Colors.black,
//              ),
//            ),
          icon: Icon(Icons.notifications),
            title: Text('Notifications', style: TextStyle(color: Color(0XFF9A9A9A))),

          ),
          BottomNavigationBarItem(
//            icon: SvgPicture.asset("assets/images/money-bag.svg",
//              color: _selectedIndex == 3 ? Color(0XFFFF7B71): Colors.black,
//            ),
              icon: Icon(Icons.settings),
            title: Text('Profile', style: TextStyle(color: Color(0XFF9A9A9A))),

          ),

        ],
      ),
    );
  }
}
