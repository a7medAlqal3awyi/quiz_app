import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz/screens/quiz/widgets/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            MaterialButton(
              onPressed: () {  },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            )
          ],
        ),
      body: const QuizBody(),
    );
  }
}
