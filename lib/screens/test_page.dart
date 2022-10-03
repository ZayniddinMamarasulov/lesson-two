import 'package:flutter/material.dart';
import 'package:lesson_two/utils/images.dart';

class TestPage extends StatelessWidget {
  String screenTitle;

  TestPage({Key? key, required this.screenTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print("WIDTH = $screenWidth");
    print("HEIGHT = $screenHeight");

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Column(
        children: [
          SizedBox(height: 120),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/200'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(60))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("BACK"))
        ],
      ),
    );
  }
}
