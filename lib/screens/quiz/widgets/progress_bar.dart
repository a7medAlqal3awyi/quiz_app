import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/question_controller.dart';
import '../../../core/colors/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F4768),
          width: 3.w,
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            debugPrint(controller.animation!.value.toString());
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation!.value,
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.w),
                  child: Text(
                    "${(controller.animation!.value * 60).round()} sec",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ))
              ],
            );
          }),
    );
  }
}
