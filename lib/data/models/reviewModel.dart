import 'package:get/get.dart';

class Review{

  Review({
    required this.date,
    required this.time,
    required this.cast,
    required this.seat,
    required this.price,
    required this.friend,
    required this.star,
    required this.good,
    required this.comment});
  String date;
  String time;
  String cast;
  String seat;
  String price;
  String friend;
  String star;
  List good;
  String comment;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    date: json["date"]?? "noData".tr,
    time: json["time"]?? "noData".tr,
    cast: json["cast"]?? "noData".tr,
    seat: json["seat"]?? "noData".tr,
    price: json["price"]?? "noData".tr,
    friend: json["friend"]?? "noData".tr,
    star: json["star"]?? "noData".tr,
    good: json["good"]?? "noData".tr,
    comment: json["comment"]?? "noData".tr,

  );


}