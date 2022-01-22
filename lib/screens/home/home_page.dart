import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:miniproject/screens/home/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> choice = [
    KEY.musical,
    KEY.theater,
    KEY.classic,
    KEY.opera,
    KEY.koreaTranditional,
    KEY.complex
  ];

  @override
  void initState() {
    Controller controller=Get.put(Controller());
    controller.loadMusical();
    controller.loadTheater();
    controller.loadClassic();
    controller.loadOpera();
    controller.loadTranditional();
    controller.loadComplex();

  }

  @override
  Widget build(BuildContext context) {
    // Get.put(Controller()).loadPoster();

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(
          top: 70.w,
        ),
        child: Column(children: [
          Container(
              width: 350.w,
              height: 670.w,
              child: DefaultTabController(
                length: 6,
                child: Column(children: [
                  TabBar(
                    onTap: (index) {
                      print(index);
                     // Get.find<Controller>().loadPoster(choice[index]);
                    },
                    tabs:
                        //choice.map((e) => Tab(text: Text(e,style: TextStyle(fontSize: 11.sp, color: Colors.black)).toString())).toList(),

                        [
                      Text("musical".tr + " |",
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                      Text("theater".tr + " |",
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                      Text("classic".tr + " |",
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                      Text("opera".tr + " |",
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                      Text("korean tranditional music".tr + " |",
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                      Text("complex".tr,
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.black)),
                    ],
                    indicatorColor: Colors.black,
                    labelPadding: EdgeInsets.all(0.w),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: Search());
                    },
                    child: Container(
                        width: 350.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.w),
                                width: Get.locale == Locale('ko') ? 50.w : 70.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Center(
                                    child: Text(
                                  'search'.tr,
                                )),
                              )
                            ])),
                  ),
                  Expanded(child: GetBuilder<Controller>(builder: (_) {
                    return TabBarView(
                        children: [
                      list("musical"),
                      list(1),
                      list(2),
                      list(3),
                      list(4),
                      list(5)
                    ]);
                  })),
                ]),
              )),
        ]),
      ),
    );
  }

  list( ct) {
    return Column(children: [
      SizedBox(
        height: 20.w,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text("#예매순위", style: TextStyle(fontWeight: FontWeight.bold))),
 Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster.length,//.length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(right: 20.w),
                        width: 100.w,
                        height: 130.w,
                        child: Image.network(
                            Get.find<Controller>().poster[index].image),
                      )
                    : Container();
              }),
        ),

      SizedBox(
        height: 20.w,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text("#예매순위", style: TextStyle(fontWeight: FontWeight.bold))),
      GetBuilder<Controller>(builder: (_) {
        return Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster.length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(right: 20.w),
                        width: 100.w,
                        height: 130.w,
                        child: Image.network(
                            Get.find<Controller>().poster[index].image),
                      )
                    : Container();
              }),
        );
      }),
      SizedBox(
        height: 20.w,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text("#예매순위", style: TextStyle(fontWeight: FontWeight.bold))),
      GetBuilder<Controller>(builder: (_) {
        return Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster.length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(right: 20.w),
                        width: 100.w,
                        height: 130.w,
                        child: Image.network(
                            Get.find<Controller>().poster[index].image),
                      )
                    : Container();
              }),
        );
      }),
      SizedBox(
        height: 20.w,
      ),
    ]);
  }
}
