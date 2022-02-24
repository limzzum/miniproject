import 'package:miniproject/configs/application.dart';

class BaseUrl{
  static String baseUrl= "http://kopis.or.kr/openApi/restful";
  static String loadPosterUrl= baseUrl+"/pblprfr?service=${KEY.serviceKey}&stdate=20000601&eddate=20220120&cpage=1&rows=10";
  static String rankingUrl= baseUrl+"/boxoffice?service=${KEY.serviceKey}&ststype=day&date=20171218";
  static String detailPoster= baseUrl+"/pblprfr/";
  static String awardsUrl= baseUrl+"/prfawad?service=${KEY.serviceKey}&stdate=20000601&eddate=20220120&cpage=1&rows=10";
}