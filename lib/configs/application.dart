
import 'package:shared_preferences/shared_preferences.dart';

class Application{
  static late SharedPreferences preferences;

  Future setPreference() async{
    preferences= await SharedPreferences.getInstance();
    print("preferencs 초기화");
    return 'loadData';
}


}

class KEY{
  static String accessToken="accessToken";
  static String refreshToken="refreshToken";
  static String musical="AAAB";
  static String theater="AAAA";
  static String classic="CCCA";
  static String opera="CCCB";
  static String koreaTranditional="CCCC";
  static String complex="EEEA";

}