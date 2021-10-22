import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/pages/home_page.dart';

class SignInViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var passwordObscure = true;

  static final formKey = GlobalKey<FormState>();

  void doSingIn() {
    if (formKey.currentState!.validate()) {
      print('Vsyo v poryadke');
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
