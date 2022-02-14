import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miniproject/controller/reviewController.dart';
import 'package:miniproject/utils/calendar_util.dart';
import 'package:intl/intl.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

final formkey = GlobalKey<FormState>();

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    var reviewController = Get.put(ReviewController());
    List castList = controller.detailPoster.cast.split(',');
    List priceList = controller.detailPoster.price.split('원,');

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(controller.detailPoster.name),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shadowColor: Colors.transparent,
            ),
            body: Container(
              // padding: EdgeInsets.only(left: 15.w,top:50.w, right: 15.w),
              width: KEY.width,
              height: KEY.height,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 40.w),
                        width: KEY.width - 40.w,
                        child: Form(
                          key: formkey,
                          child: GetBuilder<ReviewController>(
                            builder: (_) => SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(children: [
                                    buildItem(const Icon(Icons.calendar_today),
                                        "date".tr),
                                    GestureDetector(
                                        onTap: () {
                                          myDatePicker();
                                        },
                                        child: _.date != null
                                            ? buildItem2(
                                                child: Text(DateFormat(
                                                        'yyyy/MM/dd/ (E)')
                                                    .format(_.date!)))
                                            : buildItem2()),
                                  ]),
                                  SizedBox(
                                    height: 35.w,
                                  ),
                                  Row(children: [
                                    buildItem(
                                      const Icon(Icons.timer),
                                      "time".tr,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          myDateTimePicker();
                                        },
                                        child: _.time != null
                                            ? buildItem2(
                                                child: Text(DateFormat("HH:mm")
                                                    .format(_.time!)))
                                            : buildItem2())
                                  ]),
                                  SizedBox(
                                    height: 35.w,
                                  ),
                                  Row(children: [
                                    buildItem(
                                      const Icon(Icons.people),
                                      "cast".tr,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: 200.w,
                                                  height: 200.w,
                                                  child: AlertDialog(
                                                    content: Container(
                                                      width: 200.w,
                                                      height: 200.w,
                                                      child: ListView.builder(
                                                          itemCount:
                                                              castList.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                                onTap: () {
                                                              _.updateCastSelected(
                                                                  castList[
                                                                      index]);
                                                            }, child: GetBuilder<
                                                                    ReviewController>(
                                                              builder: (_) {
                                                                return ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: _.castSelected.contains(castList[
                                                                              index])
                                                                          ? Colors
                                                                              .blue
                                                                          : Colors
                                                                              .grey),
                                                                  title: Text(
                                                                      castList[
                                                                          index]),
                                                                );
                                                              },
                                                            ));
                                                          }),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            _.clearSelected();
                                                            Get.back(
                                                                closeOverlays:
                                                                    true);
                                                          },
                                                          child: Text(
                                                              "cancle".tr)),
                                                      TextButton(
                                                          onPressed: () {
                                                            _.setCast();
                                                            Get.back(
                                                                closeOverlays:
                                                                    true);
                                                          },
                                                          child: Text("ok".tr))
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: castList.isNotEmpty
                                            ? buildItem2(
                                                child: Container(
                                                    child: Text(
                                                _.cast.toString().substring(
                                                    1,
                                                    _.cast.toString().length -
                                                        1),
                                                overflow: TextOverflow.ellipsis,
                                              )))
                                            : buildItem2(
                                                child: TextFormField()))
                                  ]),
                                  SizedBox(
                                    height: 35.w,
                                  ),
                                  Row(children: [
                                    buildItem(
                                      const Icon(Icons.event_seat),
                                      "seat".tr,
                                    ),
                                    buildItem2(
                                        child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          isCollapsed: true,
                                          border: InputBorder.none),
                                      onSaved: (value) {},
                                    ))
                                  ]),
                                  SizedBox(
                                    height: 35.w,
                                  ),
                                  Row(children: [
                                    buildItem(
                                      const Icon(Icons.money),
                                      "price".tr,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: 200.w,
                                                  height: 200.w,
                                                  child: AlertDialog(
                                                    content: Container(
                                                      width: 200.w,
                                                      height: 200.w,
                                                      child: ListView.builder(
                                                          itemCount:
                                                              priceList.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                                onTap: () {
                                                              _.updatePriceSelected(
                                                                  priceList[
                                                                      index]);
                                                            }, child: GetBuilder<
                                                                    ReviewController>(
                                                              builder: (_) {
                                                                return ListTile(
                                                                  leading: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: _.priceSelected ==
                                                                              (priceList[
                                                                                  index])
                                                                          ? Colors
                                                                              .blue
                                                                          : Colors
                                                                              .grey),
                                                                  title: Text(
                                                                      priceList[
                                                                          index]),
                                                                );
                                                              },
                                                            ));
                                                          }),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back(
                                                                closeOverlays:
                                                                    true);
                                                          },
                                                          child: Text(
                                                              "cancle".tr)),
                                                      TextButton(
                                                          onPressed: () {
                                                            _.setPrice();
                                                            Get.back(
                                                                closeOverlays:
                                                                    true);
                                                          },
                                                          child: Text("ok".tr))
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: priceList.isNotEmpty
                                            ? buildItem2(
                                                child: Container(
                                                    child: Text(_.price)))
                                            : buildItem2(
                                                child: TextFormField()))
                                  ]),
                                  SizedBox(
                                    height: 35.w,
                                  ),
                                  Row(children: [
                                    buildItem(
                                      const Icon(Icons.person_add_alt_1_sharp),
                                      "friend".tr,
                                    ),
                                    buildItem2(
                                        child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          isCollapsed: true,
                                          border: InputBorder.none),
                                      onSaved: (value) {},
                                    ))
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.orangeAccent,
                    width: KEY.width.w,
                    height: 70.w,
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            formkey.currentState?.save();
                          },
                          child: Text(
                            'save'.tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.sp),
                          )),
                    ),
                  )
                ],
              ),
            )));
  }

  buildItem(
    icon,
    title,
  ) {
    return Row(
      children: [
        Container(
            width: 50.w,
            height: 50.w,
            child: FittedBox(fit: BoxFit.cover, child: icon)),

        SizedBox(
          width: 20.w,
        ),
        Container(
            alignment: Alignment.center,
            width: 50.w,
            height: 50.w,
            child: Text(
              title,
              style: TextStyle(fontSize: 20.sp),
            )),
        SizedBox(
          width: 30.w,
        ),
        // Container(
        //    width: 210.w,
        //    height: 40.w,
        //    decoration: BoxDecoration(
        //        border: Border.all(
        //          color: Colors.orangeAccent,
        //        ),
        //        borderRadius: BorderRadius.circular(11.w)
        //    ),
        //  ),
      ],
    );
  }

  buildItem2({child}) {
    return Container(
        width: 210.w,
        height: 40.w,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orangeAccent,
            ),
            borderRadius: BorderRadius.circular(11.w)),
        child: Center(child: child));
  }

  myDatePicker() {
    var controller = Get.find<Controller>();
    return DatePicker.showDatePicker(context,
        minTime: DateTime.parse(
            "${controller.detailPoster.from.substring(0, 4)}-${controller.detailPoster.from.substring(5, 7)}-${controller.detailPoster.from.substring(8, 10)}"),
        maxTime: DateTime.parse(
            "${controller.detailPoster.to.substring(0, 4)}-${controller.detailPoster.to.substring(5, 7)}-${controller.detailPoster.to.substring(8, 10)}"),
        onConfirm: (date) {
      Get.find<ReviewController>().setDate(date);
      //  pickerModel: CustomPicker(currentTime: DateTime.now(), locale: LocaleType.ko));
    });
  }

  myDateTimePicker() {
    return DatePicker.showTime12hPicker(context, onConfirm: (date) {
      Get.find<ReviewController>().setTime(date);
      print(date);

      //  pickerModel: CustomPicker(currentTime: DateTime.now(), locale: LocaleType.ko));
    });
  }
}