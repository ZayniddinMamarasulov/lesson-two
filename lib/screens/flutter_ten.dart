import 'package:flutter/material.dart';
import 'package:lesson_two/screens/home_page.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/second_page.dart';
import 'package:lesson_two/screens/test_page.dart';
import 'package:lesson_two/utils/colors.dart';

class MyTabBarView extends StatefulWidget {
  String title;

  MyTabBarView({Key? key, required this.title}) : super(key: key);

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with TickerProviderStateMixin {
  TabController? _tabController1;
  TabController? _tabController2;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(
            controller: _tabController1,
            children: [
              TestPage(screenTitle: 'screenTitle'),
              HomePage(),
              PaymentMethodPage(),
              SecondPage()
            ],
          ),
        ),
        Container(
          color: MyColors.C_F9A84D,
          height: MediaQuery.of(context).size.height * 0.1,
          child: TabBar(
            controller: _tabController1,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 2.0),
            ),
            labelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Second Second",
              ),
              Tab(
                text: "Third Third",
              ),
              Tab(
                text: "Third Third Third",
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(
            controller: _tabController2,
            children: [
              TestPage(screenTitle: 'screenTitle'),
              HomePage(),
              PaymentMethodPage(),
              SecondPage()
            ],
          ),
        ),
        Container(
          color: MyColors.C_F9A84D,
          height: MediaQuery.of(context).size.height * 0.1,
          child: TabBar(
            controller: _tabController2,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 2.0),
            ),
            labelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Second Second",
              ),
              Tab(
                text: "Third Third",
              ),
              Tab(
                text: "Third Third Third",
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
// TabBar = > Tab()
// TabBarView => UI()
