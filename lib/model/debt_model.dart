import 'dart:convert';

class Debt {
    Debt({
        required this.fullname,
        required this.avatar,
        required this.id,
        required this.sum,
        required this.valuta,
        required this.year,
        required this.month,
        required this.day,
        required this.time,
        required this.note,
    });

    String fullname;
    String avatar;
    String id;
    String sum;
    String valuta;
    String year;
    String month;
    String day;
    String time;
    String note;

    factory Debt.fromRawJson(String str) => Debt.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        fullname: json["fullname"],
        avatar: json["avatar"],
        id: json["id"],
        sum: json["sum"],
        valuta: json["valuta"],
        year: json["year"],
        month: json["month"],
        day: json["day"],
        time: json["time"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "avatar": avatar,
        "id": id,
        "sum": sum,
        "valuta": valuta,
        "year": year,
        "month": month,
        "day": day,
        "time": time,
        "note": note,
    };
}