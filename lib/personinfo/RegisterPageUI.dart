import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:iti_app/bean/event/ChangeLocalizationsLanguage.dart';

class RegisterPageUI extends StatefulWidget {
  @override
  _RegisterPageUIState createState() => _RegisterPageUIState();
}

class _RegisterPageUIState extends State<RegisterPageUI> {
  //变色标识 变字体
  int _index = 0;
  void _phoneIndex() {
    setState(() {
      _index = 0;
    });
  }

  void _emailIndex() {
    setState(() {
      _index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RegisterPhoneOrEmailInherited(
      index: _index,
      phoneIndex: _phoneIndex,
      emailIndex: _emailIndex,
      child: Scaffold(
        body: Container(
          color: Color(0xff2F3042),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InternationalLanguagePopupMenu(),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginTitleText(),
                    LoginLogo(),
                  ],
                ),
              ),
              RegisterPhoneOrEmail(),
              RegisterForm(),
              SizedBox(
                height: 50.0,
              ),
              Copyright(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering...'),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }

    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    int index = RegisterPhoneOrEmailInherited.of(context).index;
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        key: registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: index == 0 ? '请输入手机号' : "请输入邮箱",
                hintStyle: TextStyle(
                  color: Color(0xffB9B9B9),
                  fontSize: 12,
                ),
                helperText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validateUsername,
              autovalidate: autovalidate,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请输入密码',
                hintStyle: TextStyle(
                  color: Color(0xffB9B9B9),
                  fontSize: 12,
                ),
                helperText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              autovalidate: autovalidate,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '请输入邀请码',
                hintStyle: TextStyle(
                  color: Color(0xffB9B9B9),
                  fontSize: 12,
                ),
                helperText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff424351)),
                ),
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validateUsername,
              autovalidate: autovalidate,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '请输入您收到的验证码',
                    hintStyle: TextStyle(
                      color: Color(0xffB9B9B9),
                      fontSize: 12,
                    ),
                    helperText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff424351)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff424351)),
                    ),
                  ),
                  onSaved: (value) {
                    username = value;
                  },
                  validator: validateUsername,
                  autovalidate: autovalidate,
                ),
                RaisedButton(
                  color: Colors.transparent,
                  child:
                      Text('获取验证码', style: TextStyle(color: Color(0xffFCD081))),
                  elevation: 0.0,
                  onPressed: submitRegisterForm,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: ClickToRegisterToAgree(),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xff6D6D74),
                child: Text('注册', style: TextStyle(color: Color(0xff2F3042))),
                elevation: 0.0,
                onPressed: submitRegisterForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title.',
        // border: InputBorder.none,
        // border: OutlineInputBorder(),
        filled: true,
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

//iti 图片
class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/RegisterAdd.png",
      height: 150.0,
      //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
      fit: BoxFit.cover,
    );
  }
}

//注册+图片
class LoginTitleText extends StatelessWidget {
  const LoginTitleText({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("注册",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40)),
          Image.asset(
            "images/RegisterSmile.png",
            height: 30.0,
            //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

//语言
class InternationalLanguagePopupMenu extends StatefulWidget {
  InternationalLanguagePopupMenu({Key key}) : super(key: key);

  @override
  _InternationalLanguagePopupMenuState createState() =>
      _InternationalLanguagePopupMenuState();
}

class _InternationalLanguagePopupMenuState
    extends State<InternationalLanguagePopupMenu> {
  String _currentMenuItem = '简体中文';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                _currentMenuItem,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  print(value);
                  eventBus.fire(ChangeLocalizationsLanguage(value));
                  setState(() {
                    _currentMenuItem = value;
                  });
                },
                icon: Image.asset("images/DropDownSelector.png"),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: '简体中文',
                    child: Text('简体中文'),
                  ),
                  PopupMenuItem(
                    value: '繁体中文',
                    child: Text('繁体中文'),
                  ),
                  PopupMenuItem(
                    value: 'English',
                    child: Text('English'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//手机注册 邮箱注册
class RegisterPhoneOrEmail extends StatefulWidget {
  RegisterPhoneOrEmail({Key key}) : super(key: key);

  @override
  _RegisterPhoneOrEmailState createState() => _RegisterPhoneOrEmailState();
}

class _RegisterPhoneOrEmailState extends State<RegisterPhoneOrEmail> {
  //声明一个TapGestureRecognizer
  //导包import 'package:flutter/gestures.dart';
  TapGestureRecognizer tapGestureRecognizerPhone = new TapGestureRecognizer();
  TapGestureRecognizer tapGestureRecognizerEmail = new TapGestureRecognizer();

  //使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）
  @override
  void dispose() {
    tapGestureRecognizerPhone.dispose();
    tapGestureRecognizerEmail.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    //变色标识 变字体
    int index = RegisterPhoneOrEmailInherited.of(context).index;
    VoidCallback phoneIndex =
        RegisterPhoneOrEmailInherited.of(context).phoneIndex;
    VoidCallback emailIndex =
        RegisterPhoneOrEmailInherited.of(context).emailIndex;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '  手机注册  ',
            style: TextStyle(
              fontSize: index == 0 ? 18.0 : 16.0,
              color: index == 0 ? Colors.white : Color(0xffB9B9B9),
            ),
            recognizer: tapGestureRecognizerPhone..onTap = phoneIndex,
          ),
          TextSpan(
            text: '  邮箱注册  ',
            style: TextStyle(
              fontSize: index == 1 ? 18.0 : 16.0,
              color: index == 1 ? Colors.white : Color(0xffB9B9B9),
            ),
            recognizer: tapGestureRecognizerEmail..onTap = emailIndex,
          )
        ],
      ),
    );
  }
}

//点击注册即同意 《5GGMS用户协议》
class ClickToRegisterToAgree extends StatefulWidget {
  ClickToRegisterToAgree({Key key}) : super(key: key);

  @override
  _ClickToRegisterToAgreeState createState() => _ClickToRegisterToAgreeState();
}

class _ClickToRegisterToAgreeState extends State<ClickToRegisterToAgree> {
  //声明一个TapGestureRecognizer
  //导包import 'package:flutter/gestures.dart';
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();

  //使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）
  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Image.asset(
              'images/DropDownSelector.png',
              width: 20,
              height: 20,
            ),
          ),
          TextSpan(
            text: '点击注册即同意',
            style: TextStyle(fontSize: 12.0, color: Color(0xffB9B9B9)),
          ),
          TextSpan(
            text: '《5GGMS用户协议》',
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xffFCD081),
            ),
            recognizer: tapGestureRecognizer
              ..onTap = () {
                print("object1111");
              },
          )
        ],
      ),
    );
  }
}

class Copyright extends StatelessWidget {
  const Copyright({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Copyright@ 2020",
        style: TextStyle(color: Color(0xff555661)),
      ),
    );
  }
}

//全局变量
//手机注册 邮箱注册
class RegisterPhoneOrEmailInherited extends InheritedWidget {
  final Widget child;
  //变色标识 变字体
  final int index;
  //返回方法
  final VoidCallback phoneIndex;
  final VoidCallback emailIndex;

  // 生成构造函数
  RegisterPhoneOrEmailInherited(
      {Key key, this.child, this.index, this.phoneIndex, this.emailIndex})
      : super(key: key, child: child);

  static RegisterPhoneOrEmailInherited of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RegisterPhoneOrEmailInherited>();
  }

  @override
  bool updateShouldNotify(RegisterPhoneOrEmailInherited oldWidget) {
    return true;
  }
}
