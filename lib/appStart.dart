import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:miniproject/screens/loginPage.dart';

import 'bottom_navigation.dart';
import 'configs/application.dart';
import 'controller/controller.dart';

class AppStart extends StatefulWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  _AppStartState createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        builder: () => FutureBuilder(
            future: Application().setPreference(),
            builder: (context, snapshot) {
              return Container(
                  child:
                      Application.preferences.getString(KEY.accessToken) == null
                          ? LoginPage()
                          : BottomNavigation()

                  //GetBuilder<Controller>(builder: (_)=>_.login? const BottomNavigation(): const LoginPage()),
                  );
            }));
  }
}