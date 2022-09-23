import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String title = "Hello Flutter";

  @override
  Widget build(BuildContext context) {
    int a = 34;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(elevation: 0),
      body: Container(
          height: 480,
          width: double.infinity,
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.all(36.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  'Second text',
                  style: TextStyle(
                      fontSize: 32, fontFamily: 'Oswald', color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        var random = Random.secure();
                        var values =
                            List<int>.generate(5, (i) => random.nextInt(255));

                        title = "Hello ${values.first}";
                      });
                    },
                    child: Text(
                      'Click Me',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Oswald',
                      ),
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(48)),
                  onPressed: () {},
                  child: Center(child: Text("Bu Elevetad\n tugma")),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(12)),
                  onPressed: () {},
                  child: Text("Outlined button"),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        title = "Alllooo";
                      });
                    },
                    icon: Icon(
                      Icons.access_alarms_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
