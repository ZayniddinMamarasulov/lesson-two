import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson_two/screens/adaptive_page.dart';
import 'package:lesson_two/screens/home_page.dart';
import 'package:lesson_two/utils/themes.dart';

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
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bu title edi',
              themeMode: ThemeMode.system,
              darkTheme: MyThemes.themeDark,
              theme: MyThemes.themeLight,
              home: child),
        );
      },
      child: AdaptivePage(),
    );
  }
}
