class UserInfo{
  int id;
  String nickname;

  UserInfo({required this.id,required this.nickname});

  factory UserInfo.formJson(Map<String,dynamic> json)=>
      UserInfo(
        id: json["id"],
        nickname: properties.fromJson(json["properties"]).nickname
      );

}
class properties {
  properties({
    required this.nickname,
  });

  String nickname;

  factory properties.fromJson(Map<String, dynamic> json) => properties(
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
  };
}
