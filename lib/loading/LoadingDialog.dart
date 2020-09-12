import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_app/HomeUIVC.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadingState();
  }
}

class _LoadingState extends State<LoadingDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //计时器，停顿2秒
    new Future.delayed(Duration(seconds: 2), () {
      _getHasSkip();
    });
  }

  void _getHasSkip() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool hasSkip = preferences.getBool("hasSkip");
    if (hasSkip == null || !hasSkip) {
      Navigator.of(context).pushReplacementNamed("/splash");
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => HomeUIVC()),
          (route) => route == null);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/loading.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
