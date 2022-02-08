import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/controller/controller.dart';

class DetailPosterPage extends StatefulWidget {
  const DetailPosterPage({Key? key}) : super(key: key);

  @override
  _DetailPosterPageState createState() => _DetailPosterPageState();
}

class _DetailPosterPageState extends State<DetailPosterPage> {
  @override
  Widget build(BuildContext context) {
    var controller= Get.put(Controller());
    return GetBuilder<Controller>(
        builder: (_)=>Container(
      child: controller.detailPoster.image.isNotEmpty?
      Image.network(Get.find<Controller>().detailPoster.image):Container())
    );
  }
}
