import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//banner
class BannerView extends StatefulWidget {
  var data ;

  BannerView(this.data);

  @override
  State<StatefulWidget> createState() {
    return new SlideViewState(data);
  }
}

class SlideViewState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List data;

  SlideViewState(this.data);

  @override
  void initState() {
    super.initState();
    tabController =
        new TabController(length:2, vsync: this);
    // new TabController(length: data == null ? 0 : data.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    // if (data != null && data.length > 0) {
      for (var i = 0; i < 2; i++) {
        // var item = data[i];
        // var imgUrl = item['imagePath'];
        // var title = item['title'];
        // item['link'] = item['url'];
        items.add(new GestureDetector(
            onTap: () {
              _handOnItemClick("item");
            },
            child: AspectRatio(
              aspectRatio: 2.0 / 1.0,
              child: new Stack(
                children: <Widget>[
                  Image(image:AssetImage('images/icon_bannertemp.png'),width: 1000,fit: BoxFit.cover,),
                  // new Image.network(
                  //   imgUrl,
                  //   fit: BoxFit.cover,
                  //   width: 1000.0,
                  // ),
                  new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: new Container(
                      width: 1000.0,
                      color: const Color(0x50000000),
                      padding: const EdgeInsets.all(5.0),
                      child: new Text("title",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ],
              ),
            )));
      // }
    }
    return new TabBarView(
      controller: tabController,
      children: items,
    );
  }

  void _handOnItemClick(itemData) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      Fluttertoast.showToast(msg: "你点击了么");
      return null;
    }));
  }
}
