import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:iti_app/International/DemoLocalizations.dart';

class LoginPageUI extends StatefulWidget {
  LoginPageUI({Key key}) : super(key: key);

  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(16.0),
        color: Color(0xff2F3042),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            // SizedBox(
            //   height: 100.0,
            // ),
            RegisterForm(),
            DonNotHaveAnAccountToRegister(),
            SizedBox(
              height: 100.0,
            ),
            Copyright(),
          ],
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

  //忘记密码，前往找回
  void ForgetPasswordGoGetIt() {
    Navigator.pushNamed(context, '/PasswordBackPageUI');
  }

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
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        key: registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: '请输入账号',
                hintStyle: TextStyle(
                  color: Color(0xffB9B9B9),
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
            Container(
              // width: double.infinity,
              child: RaisedButton(
                color: Colors.transparent,
                child: Text('忘记密码，前往找回',
                    style: TextStyle(fontSize: 12, color: Color(0xffFCD081))),
                elevation: 0.0,
                onPressed: ForgetPasswordGoGetIt,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xff6D6D74),
                child: Text('立即登录', style: TextStyle(color: Color(0xff2F3042))),
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
      "images/Login_logo.png",
      height: 180.0,
      //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
      fit: BoxFit.cover,
    );
  }
}

class LoginTitleText extends StatelessWidget {
  const LoginTitleText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              // Localizations.of(context, DemoLocalizations).loginIn,
              DemoLocalizations.of(context).loginIn,
              // "登录",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                  decoration: TextDecoration.none)),
          Text("Wellcom ITI",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 24,
                  decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}

//还没有账号？前往注册
class DonNotHaveAnAccountToRegister extends StatefulWidget {
  DonNotHaveAnAccountToRegister({Key key}) : super(key: key);

  @override
  _DonNotHaveAnAccountToRegisterState createState() =>
      _DonNotHaveAnAccountToRegisterState();
}

class _DonNotHaveAnAccountToRegisterState
    extends State<DonNotHaveAnAccountToRegister> {
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
          TextSpan(
            text: '还没有账号？',
            style: TextStyle(fontSize: 12.0, color: Color(0xffB9B9B9)),
          ),
          TextSpan(
            text: '前往注册',
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xffFCD081),
            ),
            recognizer: tapGestureRecognizer
              ..onTap = () {
                Navigator.pushNamed(context, '/RegisterPageUI');
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
