import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:get/get.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  Future<void> _loginButtonPressed() async {

    String authCode = await AuthCodeClient.instance.request();
    OAuthToken token = await AuthApi.instance.issueAccessToken(authCode);
    Application.preferences.setString("accessToken", token.accessToken);
    Application.preferences.setString("refreshToken", token.refreshToken);
    Get.put(Controller()).changeLogin(true);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: (){_loginButtonPressed();},
        child: Text('login'),
      ),
    );
  }
}
