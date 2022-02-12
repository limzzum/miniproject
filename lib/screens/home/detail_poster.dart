

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miniproject/screens/home/review_page.dart';
import 'package:miniproject/utils/hidden_text.dart';

class DetailPosterPage extends StatefulWidget {
  //const DetailPosterPage({Key? key}) : super(key: key);
  String id;
 DetailPosterPage({Key? key, required this.id}) : super(key: key);
  @override
  _DetailPosterPageState createState() => _DetailPosterPageState();
}

class _DetailPosterPageState extends State<DetailPosterPage> {
  @override
  Widget build(BuildContext context) {
    print('sizeis'+ '${MediaQuery.of(context).size.width}');
    print('sizeis'+ '${MediaQuery.of(context).size.height}');
    var controller = Get.put(Controller());
    return FutureBuilder(
        future: controller.loadDetailPoster(widget.id),
        builder: (data,snapshot){
          if(snapshot.hasData==false){
            return const Center(child: CircularProgressIndicator());
          }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.detailPoster.name),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.star)),
            IconButton(onPressed: (){
              Get.to(()=> ReviewPage());
            }, icon: const Icon(Icons.add)),
          ],
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(left: 20.w,top: 15.w),
                color: Colors.white,
                height: 250.w,
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    children: [
                      GetBuilder<Controller>(
                          builder: (_) => Container(
                            margin: EdgeInsets.only(right: 10.w),
                              width: 160.w,
                              height: 200.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w)),
                              child: controller.detailPoster.image.isNotEmpty
                                  ? Image.network(
                                      Get.find<Controller>().detailPoster.image,
                                      fit: BoxFit.cover,
                                    )
                                  : Container())),

                      Row(children: [
                        Text('average'.tr), Icon(Icons.star), Text(controller.detailPoster.openRun)
                      ],)
                    ],
                  ),

                      Container(
                        width: 220.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit:BoxFit.cover,
                                child: Text(controller.detailPoster.name,style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold))),
                            SizedBox(
                              height: 25.w,
                            ),

                            Container(
                              width: 200.w,
                              height: 130.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                            Row(children: [
                              Icon(Icons.music_note),Text(controller.detailPoster.type,),
                            ],),
                            Row(children: [
                              Icon(Icons.music_note),Flexible(child: Text(controller.detailPoster.placeName,maxLines: 2,)),
                            ],),
                            Row(children: [
                              Icon(Icons.music_note),Flexible(child: Text(controller.detailPoster.from+"~"+controller.detailPoster.to,maxLines: 2,))
                            ],),
                            Row(children: [
                              Icon(Icons.music_note),Text(controller.detailPoster.status)
                            ],),

                              ],),
                            )

                          ],
                        ),
                      )

                ])),
            SizedBox(
              height: 20.w,
            ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              height: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w),),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height:50.w,
                    child: Text(
                      "performanceInformation".tr,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left:10.w,top: 10.w,right:10.w,bottom: 10.w),
                    decoration:  BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey,width: 0.1.w),bottom: BorderSide(color: Colors.grey,width: 0.1.w))
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(controller.detailPoster.runTime),Text("  |  "),
                        Text(controller.detailPoster.ableAge),Text("  |  "),
                        Text(controller.detailPoster.price)
                    ],),
                  ),),

                  Container(
                    padding: EdgeInsets.only(left: 30.w,right: 30.w),
                    height: 100.w,
                    child: SingleChildScrollView(
                      child:
                        HiddenText(text: controller.detailPoster.cat.trim())
                      ),
                  ),
                    ],
              ),
            ),
            SizedBox(
              height:20.w
            ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              height: 200.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w),),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50.w,
                    child: Text(
                      "cast/producing".tr,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  Container(
                    height: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text(controller.detailPoster.cast),
                      Text("producing".tr+" "+ controller.detailPoster.producer),
                      Text("company".tr +" "+ controller.detailPoster.company)
                    ],),
                  )
                ],
              ),
            ),
            SizedBox(
                height:20.w
            ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              height: 350.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w),),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50.w,
                    child: Text(
                      "averageStar".tr,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height:20.w
            ),
          ]),
        ),
      ),
    );});
  }
}
