import 'package:flutter/material.dart';
import 'package:lesson_two/screens/home_page.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/second_page.dart';
import 'package:lesson_two/screens/third_page.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bu title edi',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentMethodPage(),
    );
  }
}
