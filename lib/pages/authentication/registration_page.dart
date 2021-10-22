import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:qarz_app/pages/Authentication/signin_page.dart';
import 'package:qarz_app/pages/Authentication/signup_page.dart';

class RegistrationPage extends StatelessWidget {
  static final String id = 'registration_page';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: fullHeight,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header text
              Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Automatic identity verification which enables you to verify your identity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              
              // Center image
              Container(
                child: Image(
                  height: fullHeight / 3,
                  width: fullWidth - 60,
                  color: Colors.grey[700],
                  image: Svg(
                    'assets/images/authentication/login.svg',
                  ),
                ),
              ),

              // Buttons
              Column(
                children: [
                  // Button : Login
                  MaterialButton(
                    height: 70,
                    minWidth: double.infinity,
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignInPage.id);
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),

                  // Button : Sign up
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      height: 70,
                      minWidth: double.infinity,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpPage.id);
                      },
                      color: Colors.grey[700],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
