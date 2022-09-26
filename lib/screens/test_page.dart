import 'package:flutter/material.dart';

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
          Container(
            height: screenHeight * 0.7,
            color: Colors.black,
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
