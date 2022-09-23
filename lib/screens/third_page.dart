import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_two/utils/images.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lesson 3"),
          leading: Icon(Icons.access_alarm),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 20,
                  child: Container(
                    height: 240,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 40,
                  child: Container(
                    height: 240,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Container(
                    height: 240,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: 162,
              child: Image.asset('assets/images/img.png'),
            )
          ],
        ));
  }
}
