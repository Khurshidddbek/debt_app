import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:qarz_app/services/authentication/auth_service.dart';
import 'package:qarz_app/model/user_model.dart' as user_model;
import 'package:qarz_app/services/firestore_service/user_data_service.dart';
import 'package:qarz_app/services/prefs_service.dart';

class RegistrationViewModel extends ChangeNotifier {
  doSignInWithGoogle() async {
    User? user = await AuthService.signInWithGoogle();

    if (user != null) {
      print('\ndoSignInWithGoogle user.id: ${user.uid.toString()}\n');
      await Prefs.saveUserId(user.uid);

      user_model.User userModel = user_model.User(
        fullname: user.displayName.toString(),
        email: user.email.toString(),
        password: '',
        avatar: '1',
        uid: await Prefs.loadUserId(),
      );

      print('FullName : ${user.displayName.toString()}');
      print('Email : ${user.email.toString()}');

      UserDataService.storeUser(userModel).then((value) {
        print('\n\n Complate:\n\n');
        print(value.toString());
      });
      // Navigator => HomePage
    } else
      return;
  }
}