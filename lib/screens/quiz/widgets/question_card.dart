import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/question_controller.dart';
import '../../../core/colors/app_colors.dart';
import '../../../model/question.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    super.key,
    required this.question,
  });


  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding.w),
        padding: EdgeInsets.all(kDefaultPadding.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            question.question,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2.h,
          ),
          ...List.generate(
            question.options.length,
                (index) => Option(
              text: question.options[index],
              index: index,
              press: () => _questionController.checkAns(question, index),
            ),
          ),
        ]),
      ),
    );
  }
}
