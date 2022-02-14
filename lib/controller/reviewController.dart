import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{
  DateTime? date;
  DateTime? time;
  List<String> cast=[];
  String seat="";
  String price="";
  String friend="";
  List<String> castSelected=[];
  String priceSelected="";
  List<String> goodSelected=[];
  int star=0;
  double averageStar=0.0;


  setStar(value){
    star=value;
    update();
  }


  updateCastSelected(index){
    castSelected.contains(index)?
        castSelected.remove(index):castSelected.add(index);
    update();
  }
  updateGoodSelected(index){
    goodSelected.contains(index)?
    goodSelected.remove(index):goodSelected.length<3?
    goodSelected.add(index):Container();
    update();
  }
  updatePriceSelected(select){
    priceSelected=select;
    update();
  }
  clearSelected(){
    castSelected.clear();
    update();
  }
  setDate(date){
    this.date= date;
    update();
  }


  setTime(time){
    this.time= time;
    update();
  }

  setCast(){
    cast.addAll(castSelected);
    update();
  }
  setPrice(){
    price=priceSelected;
    update();
  }

}