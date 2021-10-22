import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  static final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var passwordObscure = true;

  void doSingUp() {
    if (formKey.currentState!.validate()) {
      print('Vsyo v poryadke sign up');
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
