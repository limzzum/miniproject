
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/data/models/userModel.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class ApiRepository{

  callUserInfo() async{
    Uri uri = Uri.parse("https://kapi.kakao.com" + "/v2/user/me"
        );
    var response= (await http.get(uri,headers: {"Content-type": "application/x-www-form-urlencoded;charset=utf-8",
    "Authorization": "Bearer ${Application.preferences.get(KEY.accessToken)}"})) ;
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==401){
      await refreshToken();
    }
    var result= jsonDecode(response.body);
    return UserInfo.formJson(result);
  }
  refreshToken() async{
    print("refreshToken");
    Uri uri = Uri.parse("https://kauth.kakao.com/oauth/token"
    );
    var response= await http.post(uri,headers: {"Content-type": "application/x-www-form-urlencoded;charset=utf-8",}
    ,body: {"grant_type":"refresh_token" ,"client_id":"9338dac6db9d9162c95333adbcb97200","refresh_token":"${Application.preferences.get(KEY.refreshToken)}"}) ;
    print(response.body);
    var result=jsonDecode(response.body);
    Application.preferences.setString(KEY.accessToken, result["access_token"]);
    Application.preferences.setString(KEY.refreshToken, result["refresh_token"]);
    print(response.statusCode);
  }

  Future<List<Poster>> callDBdata(kind) async{
    List<Poster> nullList=[];
    print("calldata");
    print(kind);
    Uri uri = Uri.parse(
        "http://www.kopis.or.kr/openApi/restful/pblprfr?service=178a9353e86d47b0a1d38c9f7a6825c1&stdate=20000601&eddate=20220120&cpage=1&rows=10&prfstate=02&shcate=$kind");
    var response = await http.get(uri);
    XmlDocument result= XmlDocument.parse(response.body);

    var xmltojson= Xml2Json()..parse(result.toXmlString());
    var json= jsonDecode(xmltojson.toParker());
    print(json);
    var list= json["dbs"]["db"];
    print(list);
    if(list!=null) {
      return list.map<Poster>((e) => Poster.fromJson(e)).toList();
    }
    return nullList;







  }

}