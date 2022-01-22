import 'package:flutter/material.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    // TODO: implement initState
    Get.put(Controller()).loadUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    print(Application.preferences.get(KEY.refreshToken));
    print(Get.find<Controller>().userInfo.nickname);
    return Scaffold(
      body: Container(
        child: Center(
            child: GetBuilder<Controller>(builder: (_)=>Text(_.userInfo.nickname,)))
      ));
  }
}
