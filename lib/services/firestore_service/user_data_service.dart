import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qarz_app/model/user_model.dart';
import 'package:qarz_app/services/prefs_service.dart';

import '../utils_service.dart';

class UserDataService {
  static final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  static Future storeUser(User user) async {
    user.uid = await Prefs.loadUserId();
    print("storeUser : user.uid = ${user.uid}");

    Map<String, String> params = await Utils.deviceParams();
    print(params.toString());

    user.deviceId = params["deviceId"]!;
    user.deviceType = params["deviceType"]!;
    user.deviceToken = params["deviceToken"]!;

    return collection.doc(user.uid).set(user.toJson());
  }
}
