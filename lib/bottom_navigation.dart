import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/screens/calendar/calendar2.dart';
import 'package:miniproject/screens/calendar/calendar_page.dart';
import 'package:miniproject/screens/community/community_page.dart';
import 'package:miniproject/screens/home/home_page.dart';
import 'package:miniproject/screens/mypage/mypage.dart';

import 'controller/controller.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    Controller controller = Get.find<Controller>();
    return GetBuilder<Controller>(builder: (controller)=>
      Scaffold(
      body: IndexedStack(
        children: const [
          CommunityPage(),
          CalendarPage(),
          HomePage(),
          MyPage(),

        ],
        index: controller.currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.ac_unit),label: 'community'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.access_alarm),label: "calendar".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.ac_unit),label:'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.access_alarm),label: "myPage".tr)
        ],

       onTap: (index){
          controller.changeIndex(index);
       },
        currentIndex: controller.currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    ));
  }
}
