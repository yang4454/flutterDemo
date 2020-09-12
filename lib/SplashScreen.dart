import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:iti_app/HomeUIVC.dart';
import 'package:shared_preferences/shared_preferences.dart';

//引导页
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  List<Slide> slides = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(new Slide(
        title: ("flutter"),
        description: "这是我的应用It",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        colorBegin: Color(0xffffffdab9),
        colorEnd: Color(0xff40e0d0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight));
    slides.add(new Slide(
        title: ("flutter"),
        description: "这是我的应用It",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        colorBegin: Color(0xffffffdab9),
        colorEnd: Color(0xff40e0d0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight));
    slides.add(new Slide(
        title: ("flutter"),
        description: "这是我的应用It",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        colorBegin: Color(0xffffffdab9),
        colorEnd: Color(0xff40e0d0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      nameSkipBtn: "跳过",
      nameNextBtn: "下一页",
      nameDoneBtn: "进入",
    );
  }

  void onDonePress() {
    _setHasSkip();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => HomeUIVC()),
        (route) => route == null);
  }

  void onSkipPress() {
    _setHasSkip();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => HomeUIVC()),
        (route) => route == null);
  }

  void _setHasSkip() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("hasSkip", true);
  }
}
