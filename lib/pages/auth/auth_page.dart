import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/login/widgets/login_widget.dart';
import 'package:lorakahnmovietips_app/pages/signup/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(onClickedSignUp: toggle)
        : SignUpWidget(onClickedSignIn: toggle);
  }

  void toggle() => setState(() => isLogin = !isLogin);
}
