import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson_two/screens/home_page.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/second_page.dart';
import 'package:lesson_two/screens/test_page.dart';
import 'package:lesson_two/screens/third_page.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 600
    // 1600
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bu title edi',
            themeMode: ThemeMode.light,
            darkTheme: ThemeData(
              primarySwatch: Colors.yellow,
            ),
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Colors.blue),
              primarySwatch: Colors.blue,
            ),
            home: child);
      },
      child: PaymentMethodPage(),
    );
  }
}
