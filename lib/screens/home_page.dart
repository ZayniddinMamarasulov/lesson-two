import 'package:flutter/material.dart';

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
          color: Colors.yellow,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
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
                      const Text(
                        "5",
                        style: TextStyle(fontSize: 48),
                      ),
                      const Text(
                        "5",
                        style: TextStyle(fontSize: 48),
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                color: Colors.blue,
              ),
              Container(
                width: 120,
                height: 120,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
