import 'package:get/get.dart';
import 'package:miniproject/data/translate/en.dart';
import 'package:miniproject/data/translate/ko.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'ko': ko
  };
}