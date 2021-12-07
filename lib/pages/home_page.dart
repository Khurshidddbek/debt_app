import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/values/user_avatars.dart';
import 'package:qarz_app/viewmodel/home_view_model.dart';
import 'package:qarz_app/views/home_page_views.dart';

import 'contacts_page.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.scrollController = ScrollController();
    viewModel.scrollController.addListener(_listenToScrollChange);

    viewModel.loadDebtList();

    super.initState();
  }

  void _listenToScrollChange() {
    if (viewModel.scrollController.offset >= 100.0) {
      setState(() {
        viewModel.isScrolled = true;
      });
    } else {
      setState(() {
        viewModel.isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (ctx, model, index) => AdvancedDrawer(
          backdropColor: Colors.grey.shade900,
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900,
                blurRadius: 20,
                spreadRadius: 5,
                offset: Offset(-20.0, 0.0),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          drawer: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User avatar
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.only(left: 20, top: 24),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800, shape: BoxShape.circle),
                      child: Image.asset(
                          "assets/images/user_avatars/avatar-1.png"),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // Username
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Khurshidbek Sobirov",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),

                    Spacer(),

                    Divider(
                      color: Colors.grey.shade800,
                    ),

                    // Menu : Dashboard, History, Contacts ...
                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.profile_2user),
                      title: Text('Contacts'),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.wallet_3),
                      title: Text('History'),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.setting_2),
                      title: Text('Settings'),
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    Divider(
                      color: Colors.grey.shade800,
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.clipboard_text),
                      title: Text('News'),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.support),
                      title: Text('Support'),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Version 1.0.0',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Page
          child: Scaffold(
              backgroundColor: Colors.grey.shade100,
              body: Stack(
                children: [
                  // UI
                  CustomScrollView(
                      controller: viewModel.scrollController,
                      slivers: [
                        // AppBar
                        SliverAppBar(
                          expandedHeight: 250.0,
                          elevation: 0,
                          pinned: true,
                          stretch: true,
                          toolbarHeight: 80,
                          backgroundColor: Colors.white,
                          leading: IconButton(
                            color: Colors.black,
                            onPressed: _handleMenuButtonPressed,
                            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible
                                        ? Iconsax.close_square
                                        : Iconsax.menu,
                                    key: ValueKey<bool>(value.visible),
                                  ),
                                );
                              },
                            ),
                          ),
                          actions: [
                            // Button : Notification
                            IconButton(
                              icon: Icon(Iconsax.notification,
                                  color: Colors.grey.shade700),
                              onPressed: () {},
                            ),
                            // // Button : More
                            // IconButton(
                            //   icon: Icon(Iconsax.more, color: Colors.grey.shade700),
                            //   onPressed: () {},
                            // ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          centerTitle: true,
                          title: AnimatedOpacity(
                            opacity: viewModel.isScrolled ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              children: [
                                Text(
                                  '\$ 1,840.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 30,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            titlePadding:
                                const EdgeInsets.only(left: 20, right: 20),
                            title: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: viewModel.isScrolled ? 0.0 : 1.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FadeIn(
                                    duration: const Duration(milliseconds: 500),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '\$',
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: 22),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          '1,840.00',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FadeIn(
                                    duration: const Duration(milliseconds: 500),

                                    // Button : Add Debt
                                    child: MaterialButton(
                                      height: 30,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, ContactsPage.id);
                                      },
                                      child: Text(
                                        "Qarz qo'shish",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                      color: Colors.transparent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // // Buttons
                        // SliverList(
                        //     delegate: SliverChildListDelegate([
                        //   SizedBox(
                        //     height: 20,
                        //   ),

                        //   Container(
                        //     padding: EdgeInsets.only(top: 20),
                        //     height: 115,
                        //     width: double.infinity,
                        //     child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: _services.length,
                        //       itemBuilder: (context, index) {
                        //         return FadeInDown(
                        //           duration: Duration(milliseconds: (index + 1) * 100),
                        //           child: AspectRatio(
                        //             aspectRatio: 1,
                        //             child: GestureDetector(
                        //               onTap: () {
                        //                 if (_services[index][0] == 'Transfer') {
                        //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
                        //                 }
                        //               },
                        //               child: Column(
                        //                 children: [
                        //                   // Icon
                        //                   Container(
                        //                     width: 60,
                        //                     height: 60,
                        //                     decoration: BoxDecoration(
                        //                       color: Colors.grey.shade900,
                        //                       borderRadius: BorderRadius.circular(20),
                        //                     ),
                        //                     child: Center(
                        //                       child: Icon(
                        //                         _services[index][1],
                        //                         color: Colors.white,
                        //                         size: 25,
                        //                       ),
                        //                     ),
                        //                   ),

                        //                   SizedBox(
                        //                     height: 10,
                        //                   ),

                        //                   Text(
                        //                     _services[index][0],
                        //                     style: TextStyle(
                        //                         color: Colors.grey.shade800, fontSize: 12),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ])),

                        // DebtList
                        SliverFillRemaining(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Stack(
                              children: [
                                // If the debtList is empty
                                if (viewModel.debtList == null ||
                                    viewModel.debtList!.isEmpty)
                                  Center(
                                    child: Text(
                                      'Debts not available. Please add Debt.',
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                else
                                  // DebtList
                                  FadeInDown(
                                      duration: Duration(milliseconds: 500),
                                      child:
                                          DebtListViews(viewModel.debtList!)),
                              ],
                            ),
                          ),
                        )
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}
