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
  int currentIndex=0;
  late UserInfo userInfo;
  List<List<Poster>> poster=[[],[],[],[],[],[]];
  List<List<Ranking>> ranking=[[],[],[],[],[],[]];

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
  loadPoster(key) async{
    print('loadposter호출');
    // poster[0]=await ApiRepository().callPoster(KEY.musical);
    // poster[1]=await ApiRepository().callPoster(KEY.theater);
    // poster[2]=await ApiRepository().callPoster(KEY.classic);
    // poster[3]=await ApiRepository().callPoster(KEY.opera);
    // poster[4]=await ApiRepository().callPoster(KEY.koreaTranditional);
    poster[key]=await ApiRepository().callPoster(choice[key]);
    print(poster);
    update();
  }
  loadRanking(key) async{
    print('loadposter호출');
    // ranking[0]=await ApiRepository().callRanking(KEY.musical);
    // ranking[1]=await ApiRepository().callRanking(KEY.theater);
    // ranking[2]=await ApiRepository().callRanking(KEY.classic);
    // ranking[3]=await ApiRepository().callRanking(KEY.opera);
    // ranking[4]=await ApiRepository().callRanking(KEY.koreaTranditional);
    ranking[key]=await ApiRepository().callRanking(choice[key]);
    print("poster[0]+$ranking");
    update();
  }

}