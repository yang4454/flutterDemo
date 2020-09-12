import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_app/res/ColorRes.dart';
import 'package:iti_app/ui/nav_four.dart';
import 'package:iti_app/ui/nav_one.dart';
import 'package:iti_app/ui/nav_third.dart';
import 'package:iti_app/ui/nav_two.dart';

class HomeUIVC extends StatefulWidget {
  HomeUIVC({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeUIVCState();
  }
}

class HomeUIVCState extends State<HomeUIVC> {
  final appBarTitle = ["首页", "云算力", "云矿机", "我的"];
  ////
  var tabImages;
  var _tabIndex = 0;
  final tabTextstyleSelected =
      TextStyle(fontSize: 12, color: ColorRes.FFFCD081);
  final tabTextstyleUnSelected =
      TextStyle(fontSize: 12, color: ColorRes.FFB9B9B9);
  var elevation = 4;
  var pages = <Widget>[nav_one(), nav_two(), nav_third(), nav_four()];
  PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: _tabIndex, keepPage: true);

    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/icon_nag1.png'),
          getTabImage('images/icon_nag11.png')
        ],
        [
          getTabImage('images/icon_nag2.png'),
          getTabImage('images/icon_nag21.png')
        ],
        [
          getTabImage('images/icon_nag3.png'),
          getTabImage('images/icon_nag31.png')
        ],
        [
          getTabImage('images/icon_nag4.png'),
          getTabImage('images/icon_nag41.png')
        ],
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
          children: pages,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _tabIndex = index;
            });
          }),
      // body: new TabBarView(controller: controller, children: pages),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: ColorRes.FFapp_bg_color,
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3))
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            pageController.jumpToPage(_tabIndex);
            //暂时不用这个是因为会整个执行所有的卡片
            // pageController.animateToPage(_tabIndex,
            //     duration: const Duration(milliseconds: 500),
            //     curve: Curves.linear);
          });
        },
      ),
    );
  }

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  Image getTabIcon(var curIndex) {
    return tabImages[curIndex][curIndex == _tabIndex ? 0 : 1];
  }

  Text getTabTitle(var curIndex) {
    return Text(
      appBarTitle[curIndex],
      style:
          curIndex == _tabIndex ? tabTextstyleSelected : tabTextstyleUnSelected,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
