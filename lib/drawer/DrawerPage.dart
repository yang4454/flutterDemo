import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_app/CommonWebsitePage.dart';
import 'package:iti_app/bean/event/LoginEvent.dart';
import 'package:iti_app/common/User.dart';
import 'package:iti_app/common/application.dart';
import 'package:iti_app/drawer/AboutMePage.dart';
import 'package:iti_app/drawer/PrettyPage.dart';
import 'package:iti_app/personinfo/LoginPageUI.dart';
import 'package:iti_app/utils/ThemeUtils.dart';
import 'package:iti_app/utils/Utils.dart';
import 'package:share/share.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DrawerPageState();
  }
}

class DrawerPageState extends State<DrawerPage> {
  bool isLogin = false;
  String username = "未登录";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.registerLoginEvent();
    if (null != User.singleton.userName) {
      isLogin = true;
      username = User.singleton.userName;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: InkWell(
              child: Text(username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () {
                if (!isLogin) {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new LoginPageUI();
                  }));
                }
              },
            ),
            currentAccountPicture: InkWell(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/head.jpg'),
              ),
              onTap: () {
                if (!isLogin) {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new LoginPageUI();
                  }));
                }
              },
            ),
          ),
          ListTile(
            title: Text('我的收藏', textAlign: TextAlign.left),
            leading: Icon(Icons.collections, size: 22.0),
            onTap: () {
              if (isLogin) {
                onCollectionClick();
              } else {
                onLoginClick();
              }
            },
          ),
          ListTile(
            title: Text('常用网站', textAlign: TextAlign.left),
            leading: Icon(
              Icons.web,
              size: 22.0,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new CommonWebsitePage();
              }));
            },
          ),
          ListTile(
            title: Text('主题', textAlign: TextAlign.left),
            leading: Icon(
              Icons.settings,
              size: 22.0,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return new SimpleDialog(
                      title: Text('设置主题'),
                      children: ThemeUtils.supportColors.map((Color color) {
                        return new SimpleDialogOption(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            height: 35,
                            color: color,
                          ),
                          onPressed: () {
                            ThemeUtils.currentColorTheme = color;
                            Utils.setColorTheme(
                                ThemeUtils.supportColors.indexOf(color));
                            changeColorTheme(color);
                            Navigator.of(context).pop();
                          },
                        );
                      }).toList(),
                    );
                  });
            },
          ),
          ListTile(
            title: Text(
              '分享',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.share, size: 22.0),
            onTap: () {
              Share.share(
                  '给你推荐一个特别好玩的应用玩安卓客户端，点击下载：https://www.pgyer.com/haFL');
            },
          ),
          ListTile(
            title: Text(
              '妹子图',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.directions_bike, size: 22.0),
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new PrettyPage();
              }));
            },
          ),
          ListTile(
            title: Text(
              '关于作者',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.info, size: 22.0),
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new AboutMePage();
              }));
            },
          ),
        ],
      ),
    );
  }

  void changeColorTheme(Color color) {}
  void onLoginClick() {}
  void onCollectionClick() {}
  void registerLoginEvent() {
    Application.eventBus.on<LoginEvent>().listen((event) {
      changeUI();
    });
  }

  void changeUI() async {
    setState(() {
      isLogin = true;
      username = User.singleton.userName;
    });
  }
}
