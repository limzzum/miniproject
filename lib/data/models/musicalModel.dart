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
    required this.openRun

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
