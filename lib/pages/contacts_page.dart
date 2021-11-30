import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/values/user_avatars.dart';
import 'package:qarz_app/viewmodel/contacts_view_model.dart';

import 'add_debt_page.dart';
import 'create_contact_page.dart';

class ContactsPage extends StatefulWidget {
  static final String id = 'contacts_page';

  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  var viewModel = ContactsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadContacts();
  }

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
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ContactsViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              // If the ContactList is empty
              if (viewModel.contactsList == null ||
                  viewModel.contactsList!.isEmpty)
                Center(
                  child: Text(
                    'Contact not available. Please add Contact.',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                // UI
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Users : Circle Animations
                      if (viewModel.contactsList!.length > 5)
                        Column(
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
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1),
                                ),
                                child: Stack(
                                  children: [
                                    for (double i = 0; i < 360; i += 60)
                                      AnimChain(
                                              initialDelay: Duration(
                                                  milliseconds: i.toInt()))
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
                          ],
                        ),

                      // Text: Most Recent
                      FadeInRight(
                        duration: Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 15, top: 10),
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
                          itemCount: viewModel.contactsList!.length,
                          itemBuilder: (context, index) {
                            return FadeInRight(
                              duration:
                                  Duration(milliseconds: (index * 100) + 500),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddDebtPage(
                                              contact: viewModel
                                                  .contactsList![index])));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.blueGrey[100],
                                        backgroundImage: AssetImage(userAvatars[
                                            int.parse(viewModel
                                                .contactsList![index].avatar)]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        viewModel.contactsList![index].fullname,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 15, top: 10),
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
                          itemCount: viewModel.contactsList!.length,
                          itemBuilder: (context, index) {
                            return FadeInRight(
                              duration:
                                  Duration(milliseconds: (index * 100) + 500),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddDebtPage(
                                              contact: viewModel
                                                  .contactsList![index])));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.red[100],
                                            backgroundImage: AssetImage(
                                                userAvatars[int.parse(viewModel
                                                    .contactsList![index]
                                                    .avatar)]),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                              viewModel.contactsList![index]
                                                  .fullname,
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              // Circular Progress Indicator
              viewModel.isLoading
                  ? Center(
                      child: CupertinoActivityIndicator(
                      radius: 40,
                    ))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacementNamed(context, CreateContactPage.id);
        },
        label: const Text('Add Contact'),
        icon: const Icon(Icons.add),
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
          print('Salim');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddDebtPage(contact: viewModel.contactsList![index])));
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
                  backgroundImage: AssetImage(userAvatars[
                      int.parse(viewModel.contactsList![index].avatar)]),
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
