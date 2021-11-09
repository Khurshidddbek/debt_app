import 'dart:convert';

class User {
    User({
        required this.fullname,
        required this.email,
        required this.password,
        required this.avatar,
        required this.uid,
        required this.deviceId,
        required this.deviceToken,
        required this.deviceType,
    });

    String fullname;
    String email;
    String password;
    String avatar;
    String uid;
    String deviceId;
    String deviceToken;
    String deviceType;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        uid: json["uid"],
        deviceId: json["deviceId"],
        deviceToken: json["deviceToken"],
        deviceType: json["deviceType"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "password": password,
        "avatar": avatar,
        "uid": uid,
        "deviceId": deviceId,
        "deviceToken": deviceToken,
        "deviceType": deviceType,
    };
}