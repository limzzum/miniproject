import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/repository.dart';

List<String> choice = [
  KEY.musical,
  KEY.theater,
  KEY.classic,
  KEY.opera,
  KEY.koreaTranditional,
  KEY.complex
];

class Controller extends GetxController{
  bool login=true;
  int currentIndex=2;
  late UserInfo userInfo;
  List<List<Poster>> poster=[[],[],[],[],[],[]];
  List<List<Ranking>> ranking=[[],[],[],[],[],[]];

  loadUserInfo() async{
    userInfo= await ApiRepository().callUserInfo();
    update();
  }
  checkLogin(){
    Application.preferences.get(KEY.accessToken)!=null?
        login=true: login=false;
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
  loadPoster(key) async{
    print('loadposter호출');
    poster[key]=await ApiRepository().callPoster(choice[key]) ;
    print("poster[$key]+${poster[key]}");
    update();
  }
  loadRanking(key) async{
    print('loadposter호출');
    ranking[key]=await ApiRepository().callRanking(choice[key]);
    print("ranking[$key]+${ranking[key]}");
    update();
  }

}