
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/learn.svg",
              color: _selectedIndex == 0 ? Color(0XFF9D1000): Color(0XFF9A9A9A)
            ),
            title: Text('Learn',  style: TextStyle( fontSize: 10.0, color: _selectedIndex == 0 ? Colors.black: Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/progress.svg",
              color: _selectedIndex == 1 ? Color(0XFF9D1000): Color(0XFF9A9A9A)
            ),
            title: Text('Progress', style: TextStyle(fontSize: 10.0, color: _selectedIndex == 1 ? Colors.black: Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/notification.svg",
              color: _selectedIndex == 2 ? Color(0XFF9D1000): Color(0XFF9A9A9A)
            ),
            title: Text('Notifications', style: TextStyle(fontSize: 10.0, color: _selectedIndex == 2 ? Colors.black : Color(0XFF9A9A9A))),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile.svg",
              color: _selectedIndex == 3 ? Color(0XFF9D1000): Color(0XFF9A9A9A)
            ),
            title: Text('Profile', style: TextStyle(fontSize: 10.0, color: _selectedIndex == 3 ? Colors.black: Color(0XFF9A9A9A))),
          ),

        ],
      ),
    );
  }
}
