import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/services/Authentication/auth_service.dart';
import 'package:qarz_app/services/prefs_service.dart';

class SignUpViewModel extends ChangeNotifier {
  static final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var passwordObscure = true;

  doSingUp() async {
    if (formKey.currentState!.validate()) {
      // Put the indicator START here.

      User? user = await AuthService.registerUsingEmailPassword(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text);

      // Put the indicator END here.

      if (user != null) {
        await Prefs.saveUserId(user.uid);

        // Firebase store user.

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
