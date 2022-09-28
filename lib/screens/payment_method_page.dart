import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_two/screens/second_page.dart';
import 'package:lesson_two/screens/test_page.dart';
import 'package:lesson_two/screens/third_page.dart';
import 'package:lesson_two/utils/colors.dart';
import 'package:lesson_two/utils/images.dart';
import 'package:lesson_two/utils/styles.dart';
import 'package:lesson_two/widgets/next_button.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String myTitle = "Payment Method";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(MyImages.image_bg),
            fit: BoxFit.cover,
          )),
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(MyImages.icon_back),
              SizedBox(height: 24.h),
              Padding(
                  padding: EdgeInsets.only(left: 5.r),
                  child: Text(
                    myTitle,
                    style: MyStyles.robotoBold700.copyWith(fontSize: 25.sp),
                  )),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 5).r,
                child: Text(
                  "This data will be displayed in your account\nprofile for security",
                  style: MyStyles.robotoRegular400.copyWith(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 24.h),
              buildButton(MyImages.image_paypal, "PAYPAL"),
              SizedBox(height: 24.h),
              buildButton(MyImages.image_visa, "VISA"),
              SizedBox(height: 24.h),
              buildButton(MyImages.image_payoneer, "PAYONEER"),
              // buildNextButton()
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: SvgPicture.asset(MyImages.icon_back),
                      prefixIcon: SvgPicture.asset(MyImages.icon_back),
                    ),
                  ),
                ),
              ),
              NextButton(
                myTitle: "Next 2",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String imageName, String title) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      splashColor: Colors.grey,
      onTap: () {
        Widget nextPage = TestPage(screenTitle: title);
        switch (title) {
          case "PAYPAL":
            nextPage = SecondPage();
            break;
          case "VISA":
            nextPage = ThirdPage();
            break;
          case "PAYONEER":
            nextPage = TestPage(screenTitle: title);
            break;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        height: 90.h,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24).r,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF253B80).withOpacity(0.2),
                blurRadius: 40,
              )
            ],
            color: Colors.white60,
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  imageName,
                  height: 32.h,
                ),
                SizedBox(height: 12.h),
                Text("From Gallery"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSome() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TestPage(screenTitle: "screenTitle")));
      },
      child: Container(
        padding: EdgeInsets.all(12).r,
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0.4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method"),
                Text("Edit"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
