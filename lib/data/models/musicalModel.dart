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
    name: json["prfnm"],
    image: json["poster"],
    id: json["mt20id"],
    subject: json["genrenm"],
    from: json["prfpdfrom"],
    to: json["prfpdto"],
    location: json["fcltynm"],
    state: json["prfstate"],
    openRun: json["openrun"]
  );

}