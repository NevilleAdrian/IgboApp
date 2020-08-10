import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';

class SplashScreen extends StatefulWidget {

  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin  {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    controller.forward();
//    controller.reverse(from: 1.0);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
      print(controller.value);
      if( controller.value == 1){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            ModalRoute.withName('/'));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
//      color: animation.value,
//      animate: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex: 4, child: SvgPicture.asset("assets/images/logo.svg", height: controller.value * 100 , )),
              Expanded(flex: 1,child: Text('Igbo Tutor Powered by Gtonia', style: TextStyle(color: Color(0XFFE20303), fontSize: 11),))
            ],
          ),
        ),
      ),
    );

  }
}
