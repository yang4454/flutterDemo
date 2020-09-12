
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:iti_app/common/application.dart';
//公告
class NoticeAdapter extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const NoticeAdapter({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          // _launchURL(itemUrl, context);
          // Application.router.navigateTo(
          //   context,
          //   '${Routes.webViewPage}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri.encodeComponent(itemUrl)}',
          //   transition: TransitionType.nativeModal,
          // );
        },
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(data,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
