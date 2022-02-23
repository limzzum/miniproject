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
import 'package:miniproject/screens/home/detail_poster.dart';
import 'package:miniproject/screens/home/search.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Controller controller = Get.put(Controller());
    for (int i = 0; i < 6; i++) {
      controller.loadPoster(i);
      controller.loadRanking(i);
    }
    //  controller.loadPoster(0);controller.loadPoster(1);controller.loadPoster(2);controller.loadPoster(3);controller.loadPoster(4);controller.loadPoster(5);
    // controller.loadRanking(0);controller.loadRanking(1);controller.loadRanking(2);controller.loadRanking(3);controller.loadRanking(4);controller.loadRanking(5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        padding: EdgeInsets.only(top: 20.w),
        alignment: Alignment.topCenter,

        child: Column(children: [
          Container(
              width: 350.w,
              height: 670.w,
              child: DefaultTabController(
                length: 6,
                child: Column(children: [

                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: Search());
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: 350.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          //  border: Border.all(width: 2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.search)
                              // Container(
                              //   margin: EdgeInsets.only(right: 10.w),
                              //   width: Get.locale == Locale('ko') ? 50.w : 70.w,
                              //   height: 30.w,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(width: 2),
                              //       borderRadius: const BorderRadius.all(
                              //           Radius.circular(5))),
                              //   child: Center(
                              //       child: Text(
                              //         'search'.tr,
                              //       )),
                              // )
                            ])),
                  ),
                  SizedBox(
                    height: 17.w,
                  ),
                  TabBar(
                    onTap: (index) {
                      print(index);
                    },
                    tabs:
                        //choice.map((e) => Tab(text: Text(e,style: TextStyle(fontSize: 11.sp, color: Colors.black)).toString())).toList(),

                        [
                      Container(
                        //width: 50.w,
                        height:30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("musical".tr ,
                              style:
                                  TextStyle(fontWeight: FontWeight.w900,)),
                        ),
                      ),
                      Container(
                       // width: 50.w,
                        height:30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("theater".tr,
                              style:
                                  TextStyle( fontWeight: FontWeight.w900,)),
                        ),
                      ),
                      Container(
                      //  width: 50.w,
                        height:30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("classic".tr,
                              style:
                                  TextStyle( fontWeight: FontWeight.w900,)),
                        ),
                      ),
                      Container(
                     //   width: 50.w,
                        height:30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("opera".tr ,
                              style:
                                  TextStyle(fontWeight: FontWeight.w900, )),
                        ),
                      ),
                      Container(
                        //width: 50.w,
                        height:30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("koreanMusic".tr ,
                              style:
                                  TextStyle( fontWeight: FontWeight.w900,overflow: TextOverflow.ellipsis )),
                        ),
                      ),
                      Container(
                       // width: 50.w,
                        height: 30.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("complex".tr,
                              style:
                                  TextStyle( fontWeight: FontWeight.w900, )),
                        ),
                      )//color: Colors.black)),
                    ],
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    labelPadding: EdgeInsets.all(4.w),
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
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 20.w,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text("today".tr.toUpperCase()+" "+"ticketing".tr.toUpperCase()+" "+"ranking".tr.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.w))),
        SizedBox(
          height: 15.w,
        ),
        Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.ranking[ct].length, //.length,
              itemBuilder: (context, index) {
                return controller.ranking[ct].isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          // controller.loadDetailPoster(
                          //     Get.find<Controller>().ranking[ct][index].id);
                          Get.to(()=> DetailPosterPage(id:controller.ranking[ct][index].id));
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(right: 20.w),
                          width: 100.w,
                          height: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: controller
                                  .ranking[ct][index]
                                  .image
                                  .contains('http')
                              ? Image.network(
                                  controller.ranking[ct][index].image,
                                  fit: BoxFit.cover)
                              : Image.network(
                                  "http://www.kopis.or.kr" +
                                     controller
                                          .ranking[ct][index]
                                          .image,
                                  fit: BoxFit.cover),
                        ),
                      )
                    : Container();
              }),
        ),
        SizedBox(
          height: 40.w,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text("awardsWinning".tr.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.w))),
        SizedBox(
          height: 15.w,
        ),
        Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.poster[ct].length,
              itemBuilder: (context, index) {
                return controller.poster[ct].isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Get.to(()=> DetailPosterPage(id:controller.poster[ct][index].id));
                        },
                        child: Container(
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.only(right: 20.w),
                            width: 100.w,
                            height: 130.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Get.find<Controller>()
                                    .poster[ct][index]
                                    .image
                                    .contains('http')
                                ? Image.network(
                                    controller.poster[ct][index].image,
                                    fit: BoxFit.cover)
                                : Image.network(
                                    "http://www.kopis.or.kr" +
                                        controller.poster[ct][index].image,
                                    fit: BoxFit.cover)),
                      )
                    : Container();
              }),
        ),
        SizedBox(
          height: 40.w,
        ),
         Align(
            alignment: Alignment.topLeft,
            child: Text("comingSoon".tr.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.w))),
        SizedBox(
          height: 15.w,
        ),
        Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster[ct].length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster[ct].isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Get.to(()=> DetailPosterPage(id:Get.find<Controller>().poster[ct][index].id));
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(right: 20.w),
                          width: 100.w,
                          height: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Image.network(
                            Get.find<Controller>().poster[ct][index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container();
              }),
        ),
        SizedBox(
          height: 40.w,
        ),

        Align(
            alignment: Alignment.topLeft,
            child: Text("performing".tr, style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.w))),
        SizedBox(
          height: 15.w,
        ),
        Container(
          width: 400.w,
          height: 130.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<Controller>().poster[ct].length,
              itemBuilder: (context, index) {
                return Get.find<Controller>().poster[ct].isNotEmpty
                    ? GestureDetector(
                  onTap: () {
                    Get.to(()=> DetailPosterPage(id:Get.find<Controller>().poster[ct][index].id));
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(right: 20.w),
                    width: 100.w,
                    height: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Image.network(
                      Get.find<Controller>().poster[ct][index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container();
              }),
        ),
        SizedBox(
          height: 40.w,
        ),
      ]),
    );
  }
}
