import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/model/user_model.dart' as user_model;
import 'package:qarz_app/services/Authentication/auth_service.dart';
import 'package:qarz_app/services/firestore_service/user_data_service.dart';
import 'package:qarz_app/services/prefs_service.dart';

class SignUpViewModel extends ChangeNotifier {
  static final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var passwordObscure = true;

  bool isLoading = false;

  doSingUp() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      User? user = await AuthService.registerUsingEmailPassword(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text);

      isLoading = false;
      notifyListeners();

      if (user != null) {
        print('doSignUp user.id: ${user.uid.toString()}');
        await Prefs.saveUserId(user.uid);

        user_model.User userModel = user_model.User(
          fullname: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          avatar: '1',
          uid: await Prefs.loadUserId(),
        );

        UserDataService.storeUser(userModel).then((value) {
          print('\n\n Complate:\n\n');
          print(value.toString());
        });
        // Navigator => HomePage
      } else
        return;
    }
  }

  // Widget ObscurePassword() {
  //   return GestureDetector(
  //       onTap: () {
  //         passwordObscure = !passwordObscure;
  //         notifyListeners();
  //       },
  //       child: passwordObscure
  //           ? Icon(
  //               Icons.remove_red_eye_rounded,
  //               color: Colors.grey,
  //             )
  //           : Icon(
  //               Icons.remove_red_eye_outlined,
  //               color: Colors.black54,
  //             ));
  // }
}
