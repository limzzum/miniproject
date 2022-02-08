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
    Get.put(Application());
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size,//const Size(39.69,85.94),
        builder: () => FutureBuilder(
            future: Application().setPreference(),
            builder: (context, snapshot) {
              if(snapshot.hasData==false){
                return const CircularProgressIndicator();
              }
              return Container(
                  child:
                 // GetBuilder<Controller>(builder: (_)=>_.login? const BottomNavigation(): const LoginPage()),
                  GetBuilder<Application>(
                  builder: (_)=> Application.preferences.getString(KEY.accessToken) == null
                          ? LoginPage()
                          : BottomNavigation()

                  ));
            }));
  }
}
