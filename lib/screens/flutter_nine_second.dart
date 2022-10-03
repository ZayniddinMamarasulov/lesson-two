import 'package:flutter/material.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/test_page.dart';

import 'home_page.dart';

class MyPageViewPage extends StatefulWidget {
  const MyPageViewPage({Key? key}) : super(key: key);

  @override
  State<MyPageViewPage> createState() => _MyPageViewPageState();
}

class _MyPageViewPageState extends State<MyPageViewPage> {
  var pageController = PageController(initialPage: 999, viewportFraction: 0.8);

  Widget getRandomImage(int index) {
    return Container(
      color: Colors.black,
      child: Image.network(
        "https://i.pravatar.cc/300?img=$index",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startPageView();
  }

  void startPageView() {
    Future.delayed(Duration(seconds: 1), () {
      callNext();
    });
  }

  void callNext() {
    if (pageController.page != 2)
      pageController.nextPage(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutSine,
      );
    else {
      pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutSine,
      );
    }
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      getRandomImage(3),
      getRandomImage(2),
      getRandomImage(50),
      getRandomImage(56),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 120),
          Container(
            height: 300,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index % 4;
                });
              },
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                return pages[index % 4];
              },
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(4, currentPage),
          ),
          ElevatedButton(
            onPressed: () {
              callNext();
            },
            child: Text("NEXT"),
          )
        ],
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }
}
