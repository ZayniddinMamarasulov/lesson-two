import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_two/utils/colors.dart';
import 'dart:io' show Platform, exit;

import 'package:lesson_two/utils/double_tap.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({Key? key}) : super(key: key);

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_FEFEFF,
      appBar: AppBar(
        actions: [
          Platform.isIOS
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: ((context) => CupertinoAlertDialog(
                            title: Text("Bu title"),
                            content: Text("Do you really want to exit ?"),
                            actions: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                onPressed: () {},
                                child: Text("OK"),
                              ),
                            ],
                          )),
                    );
                  },
                  icon: Icon(Icons.add))
              : Container()
        ],
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFCE9CE),
              Color(0xFF7C0A0C),
              Color(0xFFED974A),
            ],
          )),
        ),

        /*GridView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 150,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                color: Colors.green,
                width: 40,
                height: 120,
              );
            }),*/
      ),
      floatingActionButton: Platform.isAndroid
          ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.info),
              ),
              SizedBox(height: 12),
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text("Bu title"),
                          content: Text("Do you really want to exit ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        )),
                  );
                },
                child: Icon(Icons.add),
              ),
            ])
          : Container(),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.all(12),
              color: MyColors.C_15BE77,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/300x200"),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            tileColor: MyColors.C_F9A84D,
            style: ListTileStyle.drawer,
            onTap: () {},
            title: Text("Dunyo yangiliklari"),
            subtitle: Text("batafsil"),
            trailing: Switch.adaptive(
              value: true,
              onChanged: (value) {},
            ),
            leading: Icon(
              Icons.access_alarm,
              size: 32,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            tileColor: MyColors.C_F9A84D,
            style: ListTileStyle.drawer,
            onTap: () {},
            trailing: Checkbox(
              onChanged: (value) {},
              value: true,
            ),
            title: Text("Dunyo yangiliklari"),
            subtitle: Text("batafsil"),
            leading: Icon(
              Icons.access_alarm,
              size: 32,
            ),
          ),
          ListTile(
            tileColor: MyColors.C_F9A84D,
            style: ListTileStyle.drawer,
            onTap: () {},
            title: Text("Dunyo yangiliklari"),
            subtitle: Text("batafsil"),
            leading: Icon(
              Icons.access_alarm,
              size: 32,
            ),
          ),
          ListTile(
            tileColor: MyColors.C_F9A84D,
            style: ListTileStyle.drawer,
            onTap: () {},
            title: Text("Dunyo yangiliklari"),
            subtitle: Text("batafsil"),
            leading: Icon(
              Icons.access_alarm,
              size: 32,
            ),
          ),
          ListTile(
            tileColor: MyColors.C_F9A84D,
            style: ListTileStyle.drawer,
            onTap: () {},
            title: Text("Dunyo yangiliklari"),
            subtitle: Text("batafsil"),
            leading: Icon(
              Icons.access_alarm,
              size: 32,
            ),
          ),
        ],
      )),
    );
  }

  int backPressCounter = 0;
  int backPressTotal = 2;

  Future<bool> onWillPop() {
    if (backPressCounter < 1) {
      showMessage("Please, Click one more time to exit!");
      backPressCounter++;
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        backPressCounter--;
      });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void showMessage(String message) {
    var snack = SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: 'Tushunarli',
      ),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
