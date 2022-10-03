import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_two/utils/styles.dart';

class FlutterEight extends StatefulWidget {
  FlutterEight({Key? key}) : super(key: key);

  @override
  State<FlutterEight> createState() => _FlutterEightState();
}

class _FlutterEightState extends State<FlutterEight> {
  bool isPassVisible = true;
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  String phone = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              obscureText: false,
              onChanged: (String value) {
                setState(() {
                  phone = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {},
                ),
                hintText: 'Phone number',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passController,
              keyboardType: TextInputType.text,
              obscureText: !isPassVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: isPassVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPassVisible = !isPassVisible;
                    });
                  },
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.lock),
                  onPressed: () {},
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Text(
                  "Phone :",
                  style: MyStyles.robotoBold700.copyWith(fontSize: 24),
                ),
                SizedBox(width: 8),
                Text(
                  phone,
                  style: MyStyles.robotoRegular400.copyWith(fontSize: 18),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "Password :",
                  style: MyStyles.robotoBold700.copyWith(fontSize: 24),
                ),
                SizedBox(width: 8),
                Text(
                  "qweqweqw",
                  style: MyStyles.robotoRegular400.copyWith(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  // passController.text
                },
                child: Text("OK"))
          ],
        ),
      ),
    );
  }
}
