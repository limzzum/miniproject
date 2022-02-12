
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application extends GetxController{
  static late SharedPreferences preferences;

  Future setPreference() async{
    preferences= await SharedPreferences.getInstance();
    print("preferencs 초기화");
    update();

    return 'loadData';
}


}

class KEY{
  static String clientId="9338dac6db9d9162c95333adbcb97200";
  static String serviceKey="178a9353e86d47b0a1d38c9f7a6825c1";
  static double width=414.0;
  static double height=896.0;
  static String accessToken="accessToken";
  static String refreshToken="refreshToken";
  static String musical="AAAB";
  static String theater="AAAA";
  static String classic="CCCA";
  static String opera="CCCB";
  static String koreaTranditional="CCCC";
  static String complex="EEEA";

}