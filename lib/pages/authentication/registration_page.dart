import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:qarz_app/pages/Authentication/signin_page.dart';
import 'package:qarz_app/pages/Authentication/signup_page.dart';
import 'package:qarz_app/services/utils_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatelessWidget {
  static final String id = 'registration_page';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connect with Firebase
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      return firebaseApp;
    }

    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Container(
                  width: double.infinity,
                  height: fullHeight,
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header text
                      Column(
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.sp),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Automatic identity verification which enables you to verify your identity',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
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
                            height: 70.h,
                            minWidth: double.infinity,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, SignInPage.id);
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(50.r)),
                          ),

                          SizedBox(
                            height: 20.h,
                          ),

                          // Button : Sign up
                          Container(
                            padding: EdgeInsets.only(top: 3.h, left: 3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              height: 70.h,
                              minWidth: double.infinity,
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, SignUpPage.id);
                              },
                              color: Colors.grey[700],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.r)),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25.h,),

                      // Text : or
                      Row(
                        children: [
                          Expanded(
                            child: Divider(height: 5.h, color: Colors.grey[700],),
                          ),

                          Text('  or  ', style: TextStyle(fontFamily: 'Consolas', color: Colors.grey[700])),

                          Expanded(
                            child: Divider(height: 5.h, color: Colors.grey[700],),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h,),

                      // IconButtons : Google || Apple
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Button : Google
                          GestureDetector(
                            onTap: () {
                              Utils.fireToast('Not available yet!');
                            },
                            child: Image(
                              height: 65.h,
                              width: 65.w,
                              color: Colors.grey[700],
                              image: Svg(
                                'assets/icons/social_icons/google-logo.svg',
                              ),
                            ),
                          ),

                          // Button : Apple
                          GestureDetector(
                            onTap: () {
                              Utils.fireToast('Not available yet!');
                            },
                            child: Image(
                              height: 65.h,
                              width: 65.w,
                              color: Colors.grey[700],
                              image: Svg(
                                'assets/icons/social_icons/apple-logo.svg',
                              ),
                            ),
                          ),
                        ],
                      ),

                     // SizedBox(height: 60.h,),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
