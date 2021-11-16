import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qarz_app/services/prefs_service.dart';
import 'package:device_info/device_info.dart';

class Utils {
  static void fireToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<Map<String, String>>  deviceParams() async {
    Map<String, String> params = new Map();
    var deviceInfo = DeviceInfoPlugin();

    // Used after notification is added.
    // String fcm_token = await Prefs.loadFCM();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
        'deviceId': iosDeviceInfo.identifierForVendor,
        'deviceType': "iOS",
        'deviceToken': "Here will be the fcmToken. Used after notification is added.",
      });
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
        'deviceId': androidDeviceInfo.androidId,
        'deviceType': "android",
        'deviceToken': "Here will be the fcmToken. Used after notification is added.",
      });
    }
    return params;
  }
}