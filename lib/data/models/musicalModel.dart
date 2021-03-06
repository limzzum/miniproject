import 'package:get/get.dart';
class Poster{
  Poster({
    required this.name,
    required this.image,
    required this.id,
    required this.subject,
    required this.from,
    required this.to,
    required this.location,
    required this.state,
    required this.openRun,
    required this.awards,

  });

  String name;
  String image;
  String id;
  String subject;
  String from;
  String to;
  String location;
  String state;
  String openRun;
  String awards;

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    name: json["prfnm"]?? "name",
    image: json["poster"]?? "image" ,
    id: json["mt20id"]?? "id",
    subject: json["genrenm"]?? "subject",
    from: json["prfpdfrom"]?? "from",
    to: json["prfpdto"]?? "to",
    location: json["fcltynm"]?? "location",
    state: json["prfstate"]?? "state",
    openRun: json["openrun"]?? "openRun",
    awards: json["awards"]?? "award",
  );

}

class Ranking {
  Ranking({
    required this.id,
    required  this.image,
    required this.count,
    required this.type,
    required this.place,
    required this.name,
    required this.rank,
    required this.period,
    required this.seat,
    required this.area
  });

  String id;
  String image;
  String area;
  String count;
  String type;
  String place;
  String name;
  String rank;
  String period;
  String seat;

  factory Ranking.fromJson(Map<String, dynamic> json) => Ranking(
    id: json["mt20id"]?? "id",
    image: json["poster"]?? "image",
    count: json["prfdtcnt"]?? "count",
    type: json["cate"]?? "type",
    place: json["prfplcnm"]?? "place",
    name: json["prfnm"]?? "name",
    rank: json["rnum"]?? "rank",
    period: json["prfpd"]?? "period",
    seat: json["seatcnt"]?? "seat",
    area: json["area"] ?? "no area",

  );
}

class DetailPoster {
  DetailPoster({
    required this.id,
   // required this.subId,
    required this.name,
    required this.from,
    required this.to,
    required this.placeName,
    required this.cast,
    required this.producer,
    required this.runTime,
    required this.ableAge,
    required this.company,
    required this.price,
    required this.image,
    required this.cat,
    required this.type,
    required this.status,
    required this.openRun,
    required this.styurls,
    required this.time,
  });

  String id;
 // String subId;
  String name;
  String from;
  String to;
  String placeName;
  String cast;
  String producer;
  String runTime;
  String ableAge;
  String company;
  String price;
  String image;
  String cat;
  String type;
  String status;
  String openRun;
  List<dynamic>? styurls;
  String time;

  factory DetailPoster.fromJson(Map<String, dynamic> json) => DetailPoster(
    id: json["mt20id"]?? "",
  //  subId: json["subId"],
    name: json["prfnm"]?? "",
    from: json["prfpdfrom"]?? "noData".tr,
    to: json["prfpdto"]?? "noData".tr,
    placeName: json["fcltynm"] ?? "noData".tr,
    cast: json["prfcast"] ?? "noData".tr,
    producer: json["prfcrew"]?? "noData".tr,
    runTime: json["prfruntime"]?? "noData".tr,
    ableAge: json["prfage"]?? "noData".tr,
    company: json["entrpsnm"]?? "noData".tr,
    price: json["pcseguidance"]?? "noData".tr,
    image: json["poster"]?? "noData".tr,
    cat: json["sty"]?? "noData".tr,
    type: json["genrenm"]?? "noData".tr,
    status: json["prfstate"]?? "noData".tr,
    openRun: json["openrun"]?? "noData".tr,
    styurls: styurl.fromJson(json["styurls"]).url?? [], // List<String>.from(json["styurls"].map<String>((x) => x)),
    time: json["dtguidance"]?? "noData".tr);
}

class styurl {
  styurl({
    required this.url,
  });

  List<dynamic>? url;

  factory styurl.fromJson(Map<String, dynamic>? json) => styurl(
    url: [json?["styurl"]??""],
  );
}