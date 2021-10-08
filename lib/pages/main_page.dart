import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/pages/create_page.dart';
import 'package:qarz_app/pages/history_page.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  static final String id = 'main_page';

  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            HomePage(),
            CreatePage(),
            HistoryPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.history_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined)),
        ],
      ),
    );
  }
}