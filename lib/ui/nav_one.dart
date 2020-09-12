
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_app/res/ColorRes.dart';
import 'package:iti_app/res/StringRes.dart';
import 'package:iti_app/ui/NoticeListMsgUI.dart';
import 'package:iti_app/widget/BannerView.dart';

class nav_one extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NavOneState();
  }
}
class NavOneState extends State<nav_one>{
    @override
    Widget build(BuildContext context) {
      return Container(
            //root view
              color: ColorRes.FFapp_bg_color,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child:Column(
                //整体是列
                children: [
                  Container(//公告
                      decoration: BoxDecoration(
                          color:ColorRes.FF343548,
                          borderRadius: BorderRadius.all(Radius.circular(4.0), )
                      ),
                      height: 44,
                      padding:const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      margin:const EdgeInsets.fromLTRB(0, 44, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(image:AssetImage('images/icon_noticemsg.png'),width: 20,height: 20),
                          Expanded(child:Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 10, 0),
                              child:GestureDetector(
                                child: Text(
                                    StringRes.temp_long,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                      fontSize:12,
                                      color: ColorRes.FFFFFFFF,
                                      decoration: TextDecoration.none,

                                    )),
                                onTap: (){//进入公告详情
                                  Fluttertoast.showToast(msg:StringRes.temp_short);
                                  Navigator.of(context).pushReplacementNamed("noticeDetails");
                                },
                              )
                          ) ),
                          Container(child: GestureDetector(
                            child: Image(image:AssetImage('images/icon_white_right_arrow.png'),width: 20,height: 20 ),
                            onTap: (){
                              Fluttertoast.showToast(msg:StringRes.temp_short);
                              Navigator.of(context).push( new MaterialPageRoute(builder: (context) => NoticeListMsgUI()));
                            },
                          ),
                          )
                        ],
                      )
                  ),
                  Stack(//滚动区域
                    children: <Widget>[
                      Container(//scrollview
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: <Widget>[
                            new SliverPadding(
                              padding: const EdgeInsets.all(0.0),
                              sliver: new SliverList(
                                delegate: new SliverChildListDelegate(
                                  <Widget>[
                                    Container(
                                      height: 2000,
                                    ),
                                    Stack(
                                        children:<Widget>[
                                          Container(//收益背景图
                                            alignment:Alignment.topCenter,
                                            margin:EdgeInsets.fromLTRB(0, 37, 0, 0),
                                            child:Image(image: AssetImage('images/bg_wallet.png'),width:150,fit:BoxFit.cover),//收益北京图
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 22, 0, 10),
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                    children:<Widget>[
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 12, 8, 0),
                                                              child: Text(StringRes.kgsyITI,style: TextStyle(fontSize: 14,color:ColorRes.FFFCD081,decoration: TextDecoration.none)),),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 1),
                                                        child:Stack(
                                                            children:[
                                                              Image.asset('images/icon_vip_tag.png',fit:BoxFit.cover,width: 75,),
                                                              Padding(
                                                                padding: EdgeInsets.fromLTRB(40, 10, 2, 2),
                                                                child:Text('矿工',style: TextStyle(fontSize: 10,color:ColorRes.FF262739,decoration: TextDecoration.none)),
                                                              )
                                                            ]),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(), // 中间用Expanded控件
                                                      ),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                                          child:Text(StringRes.today_dlsy,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),),

                                                    ]
                                                ),
                                                Container(
                                                  margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Row(
                                                      children:<Widget>[
                                                        Text(StringRes.temp_long_num,style: TextStyle(fontSize: 26,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none,fontStyle: FontStyle.normal)),
                                                        Expanded( child: SizedBox(),),
                                                        Text(StringRes.temp_short_num,style: TextStyle(fontSize: 26,color:ColorRes.FFFCD081,decoration: TextDecoration.none)),
                                                      ]
                                                  )),
                                                Container(
                                                  alignment:Alignment.centerLeft,
                                                  margin: EdgeInsets.fromLTRB(3, 8, 0, 10),
                                                  child:Text(StringRes.temp_short_num,style: TextStyle(fontSize: 12,color:ColorRes.FFC8C9CF,decoration: TextDecoration.none)),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color:ColorRes.FF2F3042,
                                                          borderRadius: BorderRadius.all(Radius.circular(4.0), )
                                                      ),
                                                      padding:const EdgeInsets.fromLTRB(4, 3, 4,3),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                          children:[
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                                            width: 10,
                                                            height: 10,
                                                            child: new RaisedButton(onPressed: (){},
                                                              color: ColorRes.FFFCD081,
                                                              child: Text(""),
                                                              shape: CircleBorder(side: new BorderSide(
                                                                style: BorderStyle.none,
                                                                width: 10,
                                                              )),
                                                            ),
                                                          ),
                                                          Text("AAAA",style:TextStyle(fontSize: 12,color: ColorRes.FFFFFFFF,decoration: TextDecoration.none)),]
                                                      )),
                                                    Expanded( child: SizedBox(),),
                                                    Container(
                                                      child: new RaisedButton(onPressed: (){},
                                                        padding: EdgeInsets.fromLTRB(28, 7, 28, 6),
                                                        color: ColorRes.FFFCD081,
                                                        child: Text(StringRes.onekeyGet,style: TextStyle(fontSize: 12,color:ColorRes.FF2F3042,decoration: TextDecoration.none),),
                                                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4.0),side: new BorderSide(
                                                          style: BorderStyle.none,
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(padding: EdgeInsets.fromLTRB(5, 10, 5, 10)),
                                                GestureDetector(
                                                  onTap: (){
                                                    Fluttertoast.showToast(msg: "临时");
                                                  },
                                                  child: Text(StringRes.lookSLDefail,style: TextStyle(fontSize: 12,color:ColorRes.FFFCD081,decoration: TextDecoration.none),)
                                                ),
                                              ],
                                            ) ,
                                          )
                                        ]
                                    ),
                                    Container(//10个功能块
                                        decoration: BoxDecoration(
                                            color:ColorRes.FF343548,
                                            borderRadius: BorderRadius.all(Radius.circular(4.0), )
                                        ),
                                        padding:const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_sd.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item1,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_zz2.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item2,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_yq.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item3,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_sc.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item4,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_js.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item5,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                              ],),
                                            Padding(padding: EdgeInsets.fromLTRB(1, 10, 1, 10)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_sq.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item6,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_c2c.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item7,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      Image(image:AssetImage('images/icon_dapp.png'),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text(StringRes.item8,style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      // Image(image:AssetImage(''),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text("   ",style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                                Container(
                                                  child:Column(
                                                    children: [
                                                      // Image(image:AssetImage(''),width: 20,height: 20),
                                                      Padding(padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                                        child: Text("   ",style: TextStyle(fontSize: 12,color:ColorRes.FFFFFFFF,decoration: TextDecoration.none)),
                                                      ),
                                                    ],
                                                  ) ,
                                                ),
                                              ],)
                                          ],

                                        )
                                    ),
                                    Container(
                                      height: 180.0,
                                      child: BannerView(null),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Offstage(
                          offstage: true,
                          child:Container(//没有网络的状态
                            child: Text('ssssssss'),
                          )
                      ),
                    ],
                  )
                ],
              )

      );
    }
}
