import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_quiz/core/helper/exetention.dart';

import '../../core/colors/app_colors.dart';
import '../../core/routing/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height.h,
            child: Image.asset(
              "assets/images/bg.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      "Let's Start Quiz",
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Enter your info below",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.quizScreen);
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(
                                10.w),
                            gradient: kPrimaryGradient),
                        child: const Center(
                          child: Text('Lets Start Quiz'),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )),

        ],
      ),
    );
  }
}
