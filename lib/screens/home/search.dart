import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/controller/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail_poster.dart';

class Search extends SearchDelegate{

  var controller=Get.put(Controller());
  @override
  List<Widget>? buildActions(BuildContext context) {

  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: controller.loadSearchResult(query),
        builder: (data,snapshot){
          if(snapshot.hasData==false)
            return Center(child: CircularProgressIndicator());
          else
            if(controller.searchResult.isEmpty)
              return Text('noData'.tr);
            else {
              return Container(
                width: KEY.width.w,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20.w,top:20.w),
              child:GridView.count(
                childAspectRatio: 0.8,
                mainAxisSpacing: 20.w,
                crossAxisCount: 3,
                children: List.generate(controller.searchResult.length, (index)
                => GestureDetector(
                  onTap: () {
                    Get.to(()=> DetailPosterPage(id:controller.searchResult[index].id));
                  },
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(right: 20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: controller
                          .searchResult[index]
                          .image
                          .contains('http')
                          ? Image.network(
                          controller.searchResult[index].image,
                          fit: BoxFit.cover)
                          : Image.network(
                          "http://www.kopis.or.kr" +
                              controller.searchResult[index].image,
                          fit: BoxFit.cover)),
                )
              )
    ));
            }});
    }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}