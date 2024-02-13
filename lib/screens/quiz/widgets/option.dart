import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/question_controller.dart';
import '../../../core/colors/app_colors.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return kGreenColor;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            height: 55.h,
            width: double.infinity,
            padding: EdgeInsets.all(kDefaultPadding.w),
            margin: EdgeInsets.only(top: kDefaultPadding.h),
            decoration: BoxDecoration(
              border: Border.all(
                  color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $text",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: getTheRightColor(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  height: 26.h,
                  width: 26.w,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    border: Border.all(color: getTheRightColor()),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                    getTheRightIcon(),
                    size: 16.sp,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
