import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/services/Authentication/auth_service.dart';
import 'package:qarz_app/services/prefs_service.dart';

class SignInViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var passwordObscure = true;

  static final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  doSingIn() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      User? user = await AuthService.signInUsingEmailPassword(
          emailController.text.trim(), passwordController.text);

          isLoading = false;
          notifyListeners();

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
