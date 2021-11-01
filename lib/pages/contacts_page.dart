import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  static final String id = 'contacts_page';

  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<dynamic> _contacts = [
    {
      'name': 'Salim',
      'avatar': 'assets/images/user_avatars/avatar-1.png',
    },
    {
      'name': 'Qodir',
      'avatar': 'assets/images/user_avatars/avatar-2.png',
    },
    {
      'name': 'Zebo',
      'avatar': 'assets/images/user_avatars/avatar-3.png',
    },
    {
      'name': 'Abdullajon',
      'avatar': 'assets/images/user_avatars/avatar-4.png',
    },
    {
      'name': 'Qashqadaryo',
      'avatar': 'assets/images/user_avatars/avatar-5.png',
    },
    {
      'name': 'Qodirali',
      'avatar': 'assets/images/user_avatars/avatar-6.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Select Contact', style: TextStyle(color: Colors.black)),
        leading: BackButton(
          color: Colors.black,
        ),

        // Search TextField
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search Contacts',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            // Users : Circle Animations
            FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(90),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                child: Stack(
                  children: [
                    for (double i = 0; i < 360; i += 60)
                      AnimChain(initialDelay: Duration(milliseconds: i.toInt()))
                          .next(
                            wait: Duration(milliseconds: 1000),
                            widget: AnimatedAlignPositioned(
                              dx: 0,
                              dy: 150,
                              duration: Duration(seconds: 1),
                              rotateDegrees: 0,
                              touch: Touch.middle,
                              child: user(0, i),
                            ),
                          )
                          .next(
                              wait: Duration(seconds: 2),
                              widget: AnimatedAlignPositioned(
                                dx: i / 360,
                                dy: 150,
                                duration: Duration(seconds: 1),
                                rotateDegrees: i,
                                touch: Touch.middle,
                                child: user(0, i),
                              ))
                  ],
                ),
              ),
            ),

            SizedBox(height: 80),

            // Text: Most Recent
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15, top: 10),
                child: Text(
                  'Most Recent',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),

            // Users : Most Recent
            Container(
              height: 90,
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 500),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator => Add Moned [name, avatar]
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueGrey[100],
                              backgroundImage:
                                  AssetImage(_contacts[index]['avatar']),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              _contacts[index]['name'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // Text : All Contacts
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15, top: 10),
                child: Text('All Contacts',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500)),
              ),
            ),

            // Users : All Contacts
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 500),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red[100],
                                backgroundImage:
                                    AssetImage(_contacts[index]['avatar']),
                              ),
                              SizedBox(width: 10),
                              Text(_contacts[index]['name'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                            ),
                            color: Colors.black,
                            iconSize: 15,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          //  Navigator.push(context,
          //    MaterialPageRoute(
          //      builder: (context) => SendMoney(
          //        name: _contacts[index]['name'],
          //        avatar: _contacts[index]['avatar']
          //      )
          //    )
          //  );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 50.0]) {
    return Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}
