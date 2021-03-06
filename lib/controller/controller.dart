import 'dart:core';

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
  List<List<Poster>> awards=[[],[],[],[],[],[]];
  List<List<Poster>> completed=[[],[],[],[],[],[]];
  late DetailPoster detailPoster;
  List<Poster> searchResult=[];

  loadSearchResult(search)async{
    searchResult= await ApiRepository().SearchPoster(search);
    update();
    return 'data load';
  }

  loadDetailPoster(id) async{
    detailPoster= await ApiRepository().callDetailPoster(id);
    print('detail호출됨');
    update();
    return 'data load';
  }


  loadUserInfo() async{
    userInfo= await ApiRepository().callUserInfo(Application.preferences.get(KEY.accessToken));
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
    poster[key]=await ApiRepository().callPoster(choice[key],"02") ;
    print("poster[$key]+${poster[key]}");
    update();
  }
  loadPastPerform(key) async{
    print('comingsoon');
    completed[key]=await ApiRepository().callPoster(choice[key],"03") ;
    print("coming[$key]+${completed[key]}");
    update();
  }
  loadAwards(key) async{
    print('loadposter호출');
    awards[key]=await ApiRepository().callAwardsWinning(choice[key]) ;
    print("awards[$key]+${awards[key]}");
    update();
  }
  loadRanking(key) async{
    print('loadposter호출');
    ranking[key]=await ApiRepository().callRanking(choice[key]);
    print("ranking[$key]+${ranking[key]}");
    update();
  }

}

