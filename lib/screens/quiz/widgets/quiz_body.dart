import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_quiz/screens/quiz/widgets/progress_bar.dart';
import 'package:my_quiz/screens/quiz/widgets/question_card.dart';

import '../../../controller/question_controller.dart';
import '../../../core/colors/app_colors.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(

      children: [
        SvgPicture.asset(
          "assets/images/bg3.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text.rich(
                  TextSpan(
                      text: "Question 1",
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                            text: "/10",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp))
                      ]),
                ),
              ),
              Divider(
                thickness: 1.5.h,
              ),
              SizedBox(
                height: kDefaultPadding.h,
              ),
              Expanded(
                  child: PageView.builder(
                // block swip
                physics: const NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                itemCount: _questionController.questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
