import 'package:flutter/foundation.dart';

class User{
  //单例
  static final User singleton = User._internal();
  factory User(){
    return singleton;
  }
  User._internal();
  List<String> cookie;
  String userName;
  void saveUserInfo(UserModel ){

  }
}