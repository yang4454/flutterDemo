import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class PasswordBackPageUI extends StatefulWidget {
  PasswordBackPageUI({Key key}) : super(key: key);

  @override
  _PasswordBackPageUIState createState() => _PasswordBackPageUIState();
}

class _PasswordBackPageUIState extends State<PasswordBackPageUI> {
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
  void ForgetPasswordGoGetIt() {}

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
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请再次输入密码',
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
            Stack(
              alignment: Alignment.topRight,
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '请输入您收到的验证码',
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
                RaisedButton(
                  color: Colors.transparent,
                  child:
                      Text('获取验证码', style: TextStyle(color: Color(0xffFCD081))),
                  elevation: 0.0,
                  onPressed: submitRegisterForm,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xff6D6D74),
                child: Text('立即找回', style: TextStyle(color: Color(0xff2F3042))),
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
      "images/PasswordBack.png",
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
          Text("找回密码",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                  decoration: TextDecoration.none)),
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
