import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_two/utils/colors.dart';
import 'package:lesson_two/utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getButton(1, ""),
                  getButton(2, "ABC"),
                  getButton(3, "DEF"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getButton(4, "GHI"),
                  getButton(5, "JKL"),
                  getButton(6, "MNO"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getButton(7, "PQRS"),
                  getButton(8, "TUV"),
                  getButton(9, "WXYZ"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getButton(int number, String text) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        width: 120,
        height: 120,
        child: Center(
            child: Column(
          children: [
            Text(
              number.toString(),
              style: TextStyle(fontSize: 48),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 32),
            ),
          ],
        )),
      ),
    );
  }
}

// 53E88B
