import 'dart:convert';

class Contact {
    Contact({
        required this.fullname,
        required this.avatar,
        required this.id,
    });

    String fullname;
    String avatar;
    String id;

    factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        fullname: json["fullname"],
        avatar: json["avatar"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "avatar": avatar,
        "id": id,
    };
}
