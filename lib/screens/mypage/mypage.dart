import 'package:flutter/material.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/constants/image_constant.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    Get.put(Controller()).loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.w,
          backgroundColor: Colors.white10,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 20.w),
                onPressed: (){}, icon: Icon(Icons.settings))],),
          body: Container(
            width: KEY.width.w,
            height: KEY.height.w,
            child:Column(
              children: [
                topMypage(),
                chart()
            
            // child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //   GetBuilder<Controller>(
            //           builder: (_) => Text(
            //                 _.userInfo.nickname,
            //               )),
            //   TextButton(
            //     onPressed: () {
            //       Application.preferences.remove(KEY.accessToken);
            //     },
            //     child: Text('tokenreset'),
            //   ),
            // ]),
        ]),
          )),
    );
  }

 
}


topMypage(){
  return Container(
    padding: EdgeInsets.only(left: 30.w,right: 30.w),
    child:
    Column(children: [
     Row(
      children: [
        CircleAvatar(
          radius: 50.w,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.face,color: Colors.black,),//Image.asset(IMAGE_CONST.BOTTOM_HOME)
        ),
        SizedBox(
          width: 35.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('nickName'.tr),
              SizedBox(
                  height:15.w
              ),
              Center(child:Text('following'.tr+"    |    "+'follower'.tr),),
              SizedBox(
                height: 10.w,
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                    alignment: Alignment.center,
                    height: 26.w,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(5.w)
                    ),

                    child: Text("profileEdit".tr)),
              ),
            ],
          ),
        )

      ],
    ),

    SizedBox(
      height: 25.w,
    ),
    Container(
      padding: EdgeInsets.only(top: 15.w),
      height: 80.w,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.w)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Column(
          children: [
            Text('entireWatch'.tr),
            Text(''),
          ],
        ),
        Column(
          children: [
            Text('comment'.tr+"/"+'review'.tr),
            Text(''),
          ],
        ),
        Column(
          children: [
            Text('like'.tr),
            Icon(Icons.favorite)
          ],
        ),


      ],),
    )  
    ],)
    
  );

}

chart(){
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  return Container(
    height: 330.w,
    child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Half yearly sales analysis'),
        // Enable legend
        legend: Legend(isVisible: true,position: LegendPosition.top),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales',
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]),
  );
}
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}