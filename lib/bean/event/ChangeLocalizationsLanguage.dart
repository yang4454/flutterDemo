import 'package:event_bus/event_bus.dart';

//Bus 初始化
EventBus eventBus = new EventBus();

//广播数据
class ChangeLocalizationsLanguage {
  // ProductContentEvent 此为自己定义的广播名称。
  String str;
  ChangeLocalizationsLanguage(String str) {
    this.str = str;
  }
}
