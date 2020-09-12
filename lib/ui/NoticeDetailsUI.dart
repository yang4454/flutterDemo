import 'package:flutter/material.dart';
import 'package:iti_app/res/StringRes.dart';
//公告详情
class NoticeDetailsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(StringRes.common_my)),
        body: Center(
            child: RaisedButton(
                child: RaisedButton(
          child: Text('公告详情'),
          onPressed: () {
            Navigator.pop(context);
          },
        ))));
  }
}
