import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
static final String id = 'signin_page';

  const SignInPage({ Key? key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 243, 245, 1),
      body: Stack(
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
            )
            ),

          // Log in elements
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 30, top: 160, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text : Log in
                Text('Log in', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              
                SizedBox(height: 40,),

                // TextField: Email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 0,
                    ),  
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 40,),

                // TextField: Password
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 0,
                    ),  
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),

                SizedBox(height: 20,),

                // Button : Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                    child: Text('Forgot password?'),
                  ),
                  ],
                ),

                SizedBox(height: 100,),

                // Button: Sign in
                Padding(
                  padding: const EdgeInsets.only(left: 220),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white, size: 50,),
                    ),
                  ),
                ),

                SizedBox(height: 60,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Login with social', style: TextStyle(color: Colors.grey),),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Button : Sign in with Google
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Icon(Icons.account_balance_wallet_rounded),
                          ),
                        ),

                        SizedBox(width: 20,),

                        // Button : Sign in with Facebook
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Icon(Icons.account_balance_wallet_rounded),
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
    );
  }
}