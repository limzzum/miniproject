import 'dart:math';

import 'package:get/get.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';

class Controller extends GetxController{
  bool login=false;
  int currentIndex=0;
  late UserInfo userInfo;
  List<Poster> poster=[];
  List<Poster> musical=[];
  List<Poster> theater=[];
  List<Poster> classic=[];
  List<Poster> opera=[];
  List<Poster> korean_tranditional=[];
  List<Poster> complex=[];
  loadUserInfo() async{
    userInfo= await ApiRepository().callUserInfo();
    update();
  }
  changeLogin(check){
    login= check;
    update();
  }
   changeIndex(index){
    currentIndex= index;
    update();
  }

  loadPoster() async{
    poster=await ApiRepository().callDBdata("AAAA");
    print("poster11+$poster");
    update();
  }
  loadMusical() async{
    poster=await ApiRepository().callDBdata(KEY.musical);
    print("poster11+$poster");
    update();
  }
  loadTheater() async{
    poster=await ApiRepository().callDBdata(KEY.theater);
    print("poster11+$poster");
    update();
  }
  loadClassic() async{
    poster=await ApiRepository().callDBdata(KEY.classic);
    print("poster11+$poster");
    update();
  }
  loadOpera() async{
    poster=await ApiRepository().callDBdata(KEY.opera);
    print("poster11+$poster");
    update();
  }
  loadTranditional() async{
    poster=await ApiRepository().callDBdata(KEY.koreaTranditional);
    print("poster11+$poster");
    update();
  }
  loadComplex() async{
    poster=await ApiRepository().callDBdata(KEY.complex);
    print("poster11+$poster");
    update();
  }
}