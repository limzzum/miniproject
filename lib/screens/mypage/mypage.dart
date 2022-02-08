import 'package:flutter/material.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    Get.put(Controller()).loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // width: KEY.width.w,
          // height: KEY.height.w,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            GetBuilder<Controller>(
                    builder: (_) => Text(
                          _.userInfo.nickname,
                        )),
            TextButton(
              onPressed: () {
                Application.preferences.remove(KEY.accessToken);
              },
              child: Text('tokenreset'),
            ),
          ]),
        ));
  }
}
