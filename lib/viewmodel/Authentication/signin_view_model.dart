import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var passwordObscure = true;

  final formKey = GlobalKey<FormState>();

  Widget ObscurePassword() {
    return GestureDetector(
        onTap: () {
          passwordObscure = !passwordObscure;
          notifyListeners();
        },
        child: passwordObscure
            ? Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.grey,
              )
            : Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black54,
              ));
  }

  void doSingUp() {
    if(formKey.currentState!.validate()) {

    }
  }
}