import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/search.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/data/translate/ko.dart';
import 'package:miniproject/screens/loginPage.dart';
import 'package:miniproject/data/translate/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miniproject/utils/hidden_text.dart';

import 'appStart.dart';
import 'bottom_navigation.dart';
import 'configs/application.dart';
import 'controller/controller.dart';



void main() {
 // HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black));
  KakaoContext.clientId= "f0486b49789d839de77fe8b3dac98a16";
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return
        GetMaterialApp(
      title: 'Flutter Demo',
      translations: Messages(),
      locale: Locale('ko'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const AppStart()
    );
  }
}


