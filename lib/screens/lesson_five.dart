import 'package:flutter/material.dart';
import 'package:lesson_two/utils/images.dart';

class LessonFive extends StatelessWidget {
  const LessonFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
              ),
              Positioned(
                right: -12,
                top: -12,
                child: Image.asset(
                  MyImages.image_cancel,
                  width: 31,
                ),
              ),
              Center()
            ],
          ),
        ),
      ),
    );
  }
}
