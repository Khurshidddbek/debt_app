import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/viewmodel/Authentication/signup_view_model.dart';

class SignUpPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpViewModel viewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 243, 245, 1),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SignUpViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              // Backgraund circle
              Positioned(
                  top: -100,
                  right: -30.0,
                  child: Container(
                    height: 800,
                    width: 700,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )),

              // Sign up elements
              Container(
                height: double.infinity,
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 20, right: 30, top: 90, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Button : Log in
                    GestureDetector(
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // Text : Sign up
                    Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // TextField: Full name
                    TextField(
                      controller: viewModel.nameController,
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          gapPadding: 0,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // TextField: Email
                    TextField(
                      controller: viewModel.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          gapPadding: 0,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // TextField: Password
                    TextField(
                      controller: viewModel.passwordController,
                      style: TextStyle(letterSpacing: 2),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(letterSpacing: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          gapPadding: 0,
                        ),
                        suffixIcon: viewModel.ObscurePassword(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: viewModel.passwordObscure
                    ),

                    SizedBox(
                      height: 100,
                    ),

                    // Button: Sign up
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.id, (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_right_alt_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 60,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up with social',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Button : Sign up with Google
                            Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child:
                                    Icon(Icons.account_balance_wallet_rounded),
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            // Button : Sign up with Facebook
                            Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child:
                                    Icon(Icons.account_balance_wallet_rounded),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
