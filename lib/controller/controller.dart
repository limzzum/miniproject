import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';

class Controller extends GetxController{
  bool login=false;
  int currentIndex=0;
  late UserInfo userInfo;
  List<List<Poster>> poster=[];
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
    print('loadposter호출');
    poster[0]=await ApiRepository().callDBdata(KEY.musical);
    poster[1]=await ApiRepository().callDBdata(KEY.theater);
    poster[2]=await ApiRepository().callDBdata(KEY.classic);
    poster[3]=await ApiRepository().callDBdata(KEY.opera);
    poster[4]=await ApiRepository().callDBdata(KEY.koreaTranditional);
    poster[5]=await ApiRepository().callDBdata(KEY.complex);
    print("poster[0]+$poster");
    update();
  }
  loadMusical() async{
    musical=await ApiRepository().callDBdata(KEY.musical);
    print("poster11+$poster");
    update();
  }
  loadTheater() async{
    theater=await ApiRepository().callDBdata(KEY.theater);
    print("poster11+$poster");
    update();
  }
  loadClassic() async{
    classic=await ApiRepository().callDBdata(KEY.classic);
    print("poster11+$poster");
    update();
  }
  loadOpera() async{
    opera=await ApiRepository().callDBdata(KEY.opera);
    print("poster11+$poster");
    update();
  }
  loadTranditional() async{
    korean_tranditional=await ApiRepository().callDBdata(KEY.koreaTranditional);
    print("poster11+$poster");
    update();
  }
  loadComplex() async{
    complex=await ApiRepository().callDBdata(KEY.complex);
    print("poster11+$poster");
    update();
  }
}