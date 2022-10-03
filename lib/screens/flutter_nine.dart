import 'package:flutter/material.dart';
import 'package:lesson_two/screens/home_page.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/test_page.dart';

class MyBottomBarPage extends StatefulWidget {
  const MyBottomBarPage({Key? key}) : super(key: key);

  @override
  State<MyBottomBarPage> createState() => _MyBottomBarPageState();
}

class _MyBottomBarPageState extends State<MyBottomBarPage> {
  int selectedIndex = 0;

  List<Widget> _pages = [
    TestPage(screenTitle: "screenTitle"),
    HomePage(),
    PaymentMethodPage(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 50,
        onTap: (int tanlanganTugmachaTartibi) {
          setState(() {
            selectedIndex = tanlanganTugmachaTartibi;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
    );
  }
}
