import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/values/user_avatars.dart';

class CreateContactPage extends StatefulWidget {
  static final String id = 'create_contact_page';

  const CreateContactPage({Key? key}) : super(key: key);

  @override
  _CreateContactPageState createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  String userImage = userAvatars[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('Create Contact', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),

              // Image
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Avatars",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userAvatars.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  userAvatars[index]),
                                            )),
                                      );
                                    }),
                              ),
                            ],
                          )),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    //padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Image(
                              image: AssetImage(userImage),
                              fit: BoxFit.cover,
                            )),
                        Container(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.app_registration_rounded,
                              color: Colors.grey,
                              size: 45,
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),

              // TextField : Full name
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Enter Full name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),

              FadeInDown(
                duration: Duration(milliseconds: 500),
                child:   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                onPressed: () {
                                  // Save contact
                                },
                                color: Colors.grey[700],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
