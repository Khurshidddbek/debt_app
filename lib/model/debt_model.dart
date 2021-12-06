import 'dart:convert';

class Debt {
  Debt({
    required this.fullname,
    required this.avatar,
    required this.id,
    required this.sum,
    required this.valuta,
    required this.datetime,
    required this.note,
    required this.gave,
  });

  String fullname;
  String avatar;
  String id;
  String sum;
  String valuta;
  String datetime;
  String note;
  String gave;

  factory Debt.fromRawJson(String str) => Debt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        fullname: json["fullname"],
        avatar: json["avatar"],
        id: json["id"],
        sum: json["sum"],
        valuta: json["valuta"],
        datetime: json["datetime"],
        note: json["note"],
        gave: json["gave"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "avatar": avatar,
        "id": id,
        "sum": sum,
        "valuta": valuta,
        "datetime": datetime,
        "note": note,
        "gave": gave,
      };
}
