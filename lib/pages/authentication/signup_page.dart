import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/services/authentication/validator.dart';
import 'package:qarz_app/viewmodel/Authentication/signup_view_model.dart';

import '../home_page.dart';

class SignUpPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = SignUpViewModel();

    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SignUpViewModel>(
          builder: (ctx, model, index) => SingleChildScrollView(
            child: Container(
              height: fullHeight,
              width: fullWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Text: Login
                      Column(
                        children: [
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account, It's free",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),

                      // Form
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Form(
                          key: SignUpViewModel.formKey,
                          child: Column(
                            children: [
                              makeInput(viewModel.nameController, 'Full Name',
                                  viewModel, false),
                              SizedBox(
                                height: 40,
                              ),
                              makeInput(viewModel.emailController, 'Email',
                                  viewModel, false),
                              SizedBox(
                                height: 40,
                              ),
                              makeInput(viewModel.passwordController,
                                  'Password', viewModel, true),
                              SizedBox(
                                height: 40,
                              ),
                              makeInput(viewModel.confirmPasswordController,
                                  'Confirm password', viewModel, true),
                            ],
                          ),
                        ),
                      ),

                      // Button : Sign in
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Container(
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
                            onPressed: viewModel.doSingUp,
                            color: Colors.grey[700],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),

                      // Buton : Sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),

                          // Button : Sign up
                          Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 103,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput(TextEditingController _controller, String _labelText,
      SignUpViewModel viewModel, bool obscureText) {
    return TextFormField(
      onEditingComplete: viewModel.doSingUp,
      controller: _controller,
      style: TextStyle(letterSpacing: obscureText ? 1 : 0),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: TextStyle(letterSpacing: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          gapPadding: 0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          gapPadding: 0,
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      validator: (value) => _labelText == 'Full Name'
          ? Validator.validateName(name: value)
          : (_labelText == 'Email'
              ? Validator.validateEmail(email: value)
              : Validator.validatePassword(password: value)),
    );
  }
}





// ===========================================================================
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qarz_app/pages/home_page.dart';
// import 'package:qarz_app/viewmodel/Authentication/signup_view_model.dart';

// class SignUpPage extends StatefulWidget {
//   static final String id = 'signup_page';

//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   SignUpViewModel viewModel = SignUpViewModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(239, 243, 245, 1),
//       body: ChangeNotifierProvider(
//         create: (context) => viewModel,
//         child: Consumer<SignUpViewModel>(
//           builder: (ctx, model, index) => Stack(
//             children: [
//               // Backgraund circle
//               Positioned(
//                   top: -100,
//                   right: -30.0,
//                   child: Container(
//                     height: 800,
//                     width: 700,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                   )),

//               // Sign up elements
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 padding:
//                     EdgeInsets.only(left: 20, right: 30, top: 90, bottom: 50),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Button : Log in
//                     GestureDetector(
//                       child: Text(
//                         'Log in',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                     ),

//                     SizedBox(
//                       height: 20,
//                     ),

//                     // Text : Sign up
//                     Text(
//                       'Sign up',
//                       style:
//                           TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                     ),

//                     SizedBox(
//                       height: 30,
//                     ),

//                     // TextField: Full name
//                     TextField(
//                       controller: viewModel.nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Full name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           gapPadding: 0,
//                         ),
//                       ),
//                       keyboardType: TextInputType.name,
//                     ),

//                     SizedBox(
//                       height: 30,
//                     ),

//                     // TextField: Email
//                     TextField(
//                       controller: viewModel.emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           gapPadding: 0,
//                         ),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),

//                     SizedBox(
//                       height: 30,
//                     ),

//                     // TextField: Password
//                     TextField(
//                       controller: viewModel.passwordController,
//                       style: TextStyle(letterSpacing: 2),
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle: TextStyle(letterSpacing: 0),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           gapPadding: 0,
//                         ),
//                         suffixIcon: viewModel.ObscurePassword(),
//                       ),
//                       keyboardType: TextInputType.visiblePassword,
//                       obscureText: viewModel.passwordObscure
//                     ),

//                     SizedBox(
//                       height: 100,
//                     ),

//                     // Button: Sign up
//                     GestureDetector(
//                       onDoubleTap: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                             context, HomePage.id, (route) => false);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 220),
//                         child: Container(
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blue,
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.arrow_right_alt_rounded,
//                               color: Colors.white,
//                               size: 50,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(
//                       height: 60,
//                     ),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Sign up with social',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Button : Sign up with Google
//                             Container(
//                               height: 60,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: Center(
//                                 child:
//                                     Icon(Icons.account_balance_wallet_rounded),
//                               ),
//                             ),

//                             SizedBox(
//                               width: 20,
//                             ),

//                             // Button : Sign up with Facebook
//                             Container(
//                               height: 60,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: Center(
//                                 child:
//                                     Icon(Icons.account_balance_wallet_rounded),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
