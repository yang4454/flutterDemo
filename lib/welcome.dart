import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_app/HomeUIVC.dart';
import 'package:iti_app/SplashScreen.dart';
import 'package:iti_app/bean/event/changeThemeEvent.dart';
import 'package:iti_app/common/application.dart';
import 'package:iti_app/loading/LoadingDialog.dart';

//启动页
void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置Android状态栏未透明的沉浸，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else {}
}

class MyApp extends StatefulWidget {
// final Color themeColor = ThemeData.;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
//        themeColor = event.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "ITI",
      debugShowCheckedModeBanner: false,
      theme:
          new ThemeData(primaryColor: Colors.red, brightness: Brightness.light),
      routes: <String, WidgetBuilder>{
        "/app": (BuildContext context) => new HomeUIVC(),
        "/splash": (BuildContext context) => new SplashScreen()
      },
      home: new LoadingDialog(),
    );
  }
}
