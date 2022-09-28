import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class NextButton extends StatelessWidget {
  String myTitle = "Next";

  NextButton({Key? key, required this.myTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Center(
                child: Container(
              height: 56.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: MyColors.C_53E88B,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      MyColors.C_53E88B,
                      MyColors.C_15BE77,
                    ],
                  )),
              child: Center(
                  child: Text(
                myTitle,
                style: MyStyles.robotoBold700.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              )),
            )),
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      ),
    );
  }
}
