
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:miniproject/data/network/baseUrl.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class ApiRepository{

  //kakao userInfo
  callUserInfo(accessToken) async{
    Uri uri = Uri.parse("https://kapi.kakao.com" + "/v2/user/me"
        );
    var response= (await http.get(uri,headers: {"Content-type": "application/x-www-form-urlencoded;charset=utf-8",
    "Authorization": "Bearer $accessToken"})) ;
    print("userinfo"+response.body);
    print("userinfo"+response.statusCode.toString());
    if(response.statusCode==401){
      var token=await refreshToken();
      return callUserInfo(token);
    }
    var result= jsonDecode(response.body);
    return UserInfo.formJson(result);
  }

  refreshToken() async{
    print("refreshToken");
    Uri uri = Uri.parse("https://kauth.kakao.com/oauth/token"
    );
    var response= await http.post(uri,headers: {"Content-type": "application/x-www-form-urlencoded;charset=utf-8",}
    ,body: {"grant_type":"refresh_token" ,"client_id":KEY.clientId,"refresh_token":"${Application.preferences.get(KEY.refreshToken)}"}) ;
    print(response.body);
    var result=jsonDecode(response.body);
    Application.preferences.setString(KEY.accessToken, result["access_token"]);
   // Application.preferences.setString(KEY.refreshToken, result["refresh_token"]);
    print(response.statusCode);
    return result["access_token"];
  }

  //전체포스터 장르
  Future<List<Poster>> callPoster(kind) async{
    List<Poster> nullList=[];
    print("calldata");
    print(kind);
    Uri uri = Uri.parse(
        BaseUrl.loadPosterUrl+"&prfstate=02&shcate=$kind");
    var response = await http.get(uri);
    XmlDocument result= XmlDocument.parse(response.body);

    var xmltojson= Xml2Json()..parse(result.toXmlString());
    var json= jsonDecode(xmltojson.toParker());
    var list= json["dbs"]["db"];
    print(list);

    if(list!=null)
    {
      try{return list.map<Poster>((e)=>Poster.fromJson(e)).toList();}
      catch(e){
        print("오류발생$e");
        return [Poster.fromJson(list)];}}
    return nullList;
  }
  Future<List<Poster>> SearchPoster(search) async{
    List<Poster> nullList=[];

    Uri uri = Uri.parse(
        BaseUrl.loadPosterUrl+"&shprfnm=$search");
    var response = await http.get(uri);
    XmlDocument result= XmlDocument.parse(response.body);

    var xmltojson= Xml2Json()..parse(result.toXmlString());
    var json= jsonDecode(xmltojson.toParker());

    if(json.toString()=="{dbs: null}"){
      return nullList;
    }
    var list= json["dbs"]["db"];
    print(list);

    if(list!=null)
    {
      try{return list.map<Poster>((e)=>Poster.fromJson(e)).toList();}
      catch(e){
        print("오류발생$e");
        return [Poster.fromJson(list)];}}
    return nullList;
  }

  //순위 장르별
  Future<List<Ranking>> callRanking(type) async{
    print(type);
    List<Ranking> nullList=[];

    Uri uri = Uri.parse(
        BaseUrl.rankingUrl+"&catecode=$type");
    var response = await http.get(uri);
    XmlDocument result= XmlDocument.parse(response.body);

    var xmltojson= Xml2Json()..parse(result.toXmlString());
    var json= jsonDecode(xmltojson.toParker());
    var list= json["boxofs"]["boxof"];
    print('type=$type,list=$list');
    if(list!=null) {
      try{
      return list.map<Ranking>((e) => Ranking.fromJson(e)).toList();}
      catch(e){
        return [Ranking.fromJson(list)];
      }
    }
    return nullList;
  }

  Future<DetailPoster> callDetailPoster(id) async{

    Uri uri = Uri.parse(
        BaseUrl.detailPoster+id+"?service=${KEY.serviceKey}");
    var response = await http.get(uri);
    XmlDocument result= XmlDocument.parse(response.body);

    var xmltojson= Xml2Json()..parse(result.toXmlString());
    var json= jsonDecode(xmltojson.toParker());
    print(json);
    var list= json["dbs"]["db"];
    print(list);

    return DetailPoster.fromJson(list);
    // if(list!=null) {
    //   try{
    //     return list.map<Ranking>((e) => Ranking.fromJson(e)).toList();}
    //   catch(e){
    //     return [Ranking.fromJson(list)];
    //   }
    // }
  }




}