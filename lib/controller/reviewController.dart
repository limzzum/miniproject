import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{
  DateTime? date;
  DateTime? time;
  String cast="";
  String seat="";
  int price=0;
  String friend="";

  setDate(date){
    this.date= date;
    update();
  }

  setTime(time){
    this.time= time;
    update();
  }

}