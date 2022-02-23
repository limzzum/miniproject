import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            Get.locale==Locale('ko')?
            Get.updateLocale(Locale('en')):Get.updateLocale(Locale('ko'));
          }, child: Text('change'))
        ],
      ),
    );
  }
}
