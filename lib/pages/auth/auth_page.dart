import 'package:flutter/material.dart';
import 'package:task_manager/pages/auth/sign_in.dart';
import 'package:task_manager/pages/auth/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return flag ?
    SignUp(onClickedSignUp: toggle) :
    SignIn(onClickedSignUp: toggle);
  }
  void toggle() => setState(() {
    flag = !flag;
  });
}
