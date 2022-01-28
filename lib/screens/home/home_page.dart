import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/network/repository.dart';
import 'package:miniproject/screens/home/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    Controller controller = Get.put(Controller());
    for(int i=0;i<6; i++){
      controller.loadPoster(i);
      controller.loadRanking(i);
    }
 //  controller.loadPoster(0);controller.loadPoster(1);controller.loadPoster(2);controller.loadPoster(3);controller.loadPoster(4);controller.loadPoster(5);
 // controller.loadRanking(0);controller.loadRanking(1);controller.loadRanking(2);controller.loadRanking(3);controller.loadRanking(4);controller.loadRanking(5);
  }

  @override
  Widget build(BuildContext context) {
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
                    return TabBarView(children: [
                      list(0),
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

  list(ct) {
    var controller = Get.find<Controller>();
    return Column(children: [
      SizedBox(
        height: 20.w,
      ),
      const Align(
          alignment: Alignment.topLeft,
          child: Text("#예매순위", style: TextStyle(fontWeight: FontWeight.bold))),
      Container(
        width: 400.w,
        height: 130.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Get.find<Controller>().ranking[ct].length, //.length,
            itemBuilder: (context, index) {
              return Get.find<Controller>().ranking[ct].isNotEmpty
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(right: 20.w),
                      width: 100.w,
                      height: 130.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child:
                      Get.find<Controller>().ranking[ct][index].image.contains('http')?
                          Image.network(Get.find<Controller>().ranking[ct][index].image,fit:BoxFit.cover):
                      Image.network("http://www.kopis.or.kr" +
                          Get.find<Controller>().ranking[ct][index].image,fit:BoxFit.cover),
                    )
                  : Container();
            }),
      ),
      SizedBox(
        height: 20.w,
      ),
       const Align(
          alignment: Alignment.topLeft,
          child: Text("#포스터", style: TextStyle(fontWeight: FontWeight.bold))),
      Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.poster[ct].length,
              itemBuilder: (context, index) {
                return controller.poster[ct].isNotEmpty
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.only(right: 20.w),
                        width: 100.w,
                        height: 130.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child:Get.find<Controller>().poster[ct][index].image.contains('http')?
                        Image.network(controller.poster[ct][index].image,fit:BoxFit.cover):
                        Image.network("http://www.kopis.or.kr" +controller.poster[ct][index].image,fit:BoxFit.cover)
                      )
                    : Container();
              }),
        ),
      SizedBox(
        height: 20.w,
      ),
       const Align(
          alignment: Alignment.topLeft,
          child: Text("#포스", style: TextStyle(fontWeight: FontWeight.bold))),
      Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster[ct].length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster[ct].isNotEmpty
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.only(right: 20.w),
                        width: 100.w,
                        height: 130.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child:
                            Image.network(Get.find<Controller>().poster[ct][index].image,fit:BoxFit.cover,),
                      )
                    : Container();
              }),
        ),
      SizedBox(
        height: 20.w,
      ),
    ]);
  }
}
