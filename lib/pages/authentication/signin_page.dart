import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/services/authentication/validator.dart';
import 'package:qarz_app/viewmodel/Authentication/signin_view_model.dart';

class SignInPage extends StatefulWidget {
  static final String id = 'signin_page';

  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    SignInViewModel viewModel = SignInViewModel();

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
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SignInViewModel>(
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
                            'Login',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Login to your acount',
                            style:
                                TextStyle(fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
              
                      // Form
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Form(
                          key: SignInViewModel.formKey,
                          child: Column(
                            children: [
                              makeInput(viewModel.emailController, 'Email', viewModel),
                              SizedBox(
                                height: 40,
                              ),
                              makeInput(viewModel.passwordController, 'Password', viewModel),
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
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            onPressed: viewModel.doSingIn,
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
                          Text("Don't have an account? "),
              
                          // Button : Sign up
                          Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                    
                      SizedBox(height: 103,),
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

  Widget makeInput(TextEditingController _controller, String _labelText, SignInViewModel viewModel) {
    return TextFormField(
      onEditingComplete: viewModel.doSingIn,
      controller: _controller,
      style: TextStyle(letterSpacing: _labelText == 'Email' ? 0 : 1),
      obscureText: _labelText == 'Email' ? false : true,
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
      validator: (value) => _labelText == 'Email'
          ? Validator.validateEmail(email: value)
          : Validator.validatePassword(password: value),
    );
  }
}





// ===========================================================================
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qarz_app/pages/Authentication/signup_page.dart';
// import 'package:qarz_app/services/Authentication/validator.dart';
// import 'package:qarz_app/viewmodel/Authentication/signin_view_model.dart';

// class SignInPage extends StatefulWidget {
//   static final String id = 'signin_page';

//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   SignInViewModel viewModel = SignInViewModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(239, 243, 245, 1),
//       body: ChangeNotifierProvider(
//         create: (context) => viewModel,
//         child: Consumer<SignInViewModel>(
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

//               // Log in elements
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 padding:
//                     EdgeInsets.only(left: 20, right: 30, top: 160, bottom: 50),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Text : Log in
//                     Text(
//                       'Log in',
//                       style:
//                           TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                     ),

//                     SizedBox(
//                       height: 40,
//                     ),

//                     // TextFields
//                     Form(
//                       key: viewModel.formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // TextField: Email
//                           TextFormField(
//                             controller: viewModel.emailController,
//                             decoration: InputDecoration(
//                               labelText: 'Email',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 gapPadding: 0,
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 gapPadding: 0,
//                                 borderSide: BorderSide(
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (value) =>
//                                 Validator.validateEmail(email: value),
//                           ),

//                           SizedBox(
//                             height: 40,
//                           ),

//                           // TextField: Password
//                           TextFormField(
//                             controller: viewModel.passwordController,
//                             style: TextStyle(letterSpacing: 2),
//                             decoration: InputDecoration(
//                               labelText: 'Password',
//                               labelStyle: TextStyle(letterSpacing: 0),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 gapPadding: 0,
//                               ),
//                               suffixIcon: viewModel.ObscurePassword(),
//                               errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 gapPadding: 0,
//                                 borderSide: BorderSide(
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ),
//                             keyboardType: TextInputType.visiblePassword,
//                             obscureText: viewModel.passwordObscure,
//                             validator: (value) =>
//                                 Validator.validatePassword(password: value),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(
//                       height: 20,
//                     ),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // Button : Sign up
//                         GestureDetector(
//                           child: Text(
//                             'Sign up',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                           onTap: () {
//                             Navigator.pushNamed(context, SignUpPage.id);
//                           },
//                         ),

//                         // Button : Forgot password
//                         GestureDetector(
//                           child: Text(
//                             'Forgot password?',
//                             style:
//                                 TextStyle(decoration: TextDecoration.underline),
//                           ),
//                         ),
//                       ],
//                     ),

//                     SizedBox(
//                       height: 70,
//                     ),

//                     // Button: Sign in
//                     GestureDetector(
//                       onTap: viewModel.doSingUp,
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
//                           'Login with social',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Button : Sign in with Google
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

//                             // Button : Sign in with Facebook
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