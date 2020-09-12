import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_app/HomeUIVC.dart';
import 'package:iti_app/SplashScreen.dart';
import 'package:iti_app/bean/event/changeThemeEvent.dart';
import 'package:iti_app/common/application.dart';
import 'package:iti_app/loading/LoadingDialog.dart';
import 'package:iti_app/personinfo/LoginPageUI.dart';
import 'package:iti_app/personinfo/RegisterPageUI.dart';
import 'package:iti_app/personinfo/PasswordBackPageUI.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iti_app/International/DemoLocalizations.dart';

import 'bean/event/ChangeLocalizationsLanguage.dart';

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
  Locale _locale = const Locale('zh', 'CN');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
//        themeColor = event.color;
      });
    });

    eventBus.on<ChangeLocalizationsLanguage>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print(event.str);

      setState(() {
        // locale:
        // _locale;
        if (event.str == "简体中文") {
          _locale = const Locale('zh', 'CN');
        } else if (event.str == "繁体中文") {
          _locale = const Locale('zh', 'CN');
        } else if (event.str == "English") {
          _locale = const Locale('en', 'US');
        } else {}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // locale: Locale('en', 'US'),
      locale: _locale, //Locale('zh', 'CN'),

      // localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
      //   return Locale('en', 'US');
      // },
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'), // English
        const Locale('he', 'IL'), // Hebrew
        // ... other locales the app supports
      ],
      title: "ITI",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // platform: TargetPlatform.iOS,
        primaryColor: Colors.red,
        brightness: Brightness.light,
      ),
      initialRoute: "/LoginPageUI",
      routes: <String, WidgetBuilder>{
        "/LoadingDialog": (BuildContext context) => LoadingDialog(),
        "/app": (BuildContext context) => HomeUIVC(),
        "/splash": (BuildContext context) => SplashScreen(),
        "/LoginPageUI": (BuildContext context) => LoginPageUI(),
        "/RegisterPageUI": (BuildContext context) => RegisterPageUI(),
        "/PasswordBackPageUI": (BuildContext context) => PasswordBackPageUI(),
      },
    );
  }
}
