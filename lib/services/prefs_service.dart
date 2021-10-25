import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('PREFS : UserID saved successfully in SharedPreferences. UserID : $userId');
    return prefs.setString('user_id', userId);
  }

  static Future<String?> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userId');
    return token;
  }

  static Future<bool> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('userId');
  }
}
