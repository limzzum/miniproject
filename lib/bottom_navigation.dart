import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          HomePage(),
          MyPage()
        ],
        index: controller.currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label:'home'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "mypage")
        ],

       onTap: (index){
          controller.changeIndex(index);
       },
        currentIndex: controller.currentIndex,
        selectedItemColor: Color.fromARGB(50, 50, 8, 8),
      ),
    ));
  }
}
