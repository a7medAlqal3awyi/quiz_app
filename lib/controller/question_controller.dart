import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation? _animation;
  AnimationController? _animationController;

  PageController? _pageController;

  PageController? get pageController => _pageController;

  AnimationController? get animationController => _animationController;

  Animation? get animation => _animation;

  final List<Question> _questions = sampleData
      .map((question) => Question(
    id: question['id'],
    ans: question['answer_index'],
    options: question['options'],
    question: question['question'],
  ))
      .toList();

  List<Question> get questions => _questions;
  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;
  int _correctAns = 0;

  int get correctAns => _correctAns;
  int _selectedAns = 0;

  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;
  int _numberOfAnswered = 0;

  int get numberOfAnswered => _numberOfAnswered;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_animationController as Animation<double>)
      ..addListener(() {
        update();
      });

    _animationController!.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }
  @override
  void onClose () {
    _animationController!.dispose();
    _pageController!.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.ans;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numberOfAnswered++;
    _animationController!.stop();
    update();


    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }
  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      // reset the counter
      _animationController!.reset();
      // start it again
      // once the time is finished go to the next page
      _animationController!.forward().whenComplete(nextQuestion);
    }
  }
  void updateQnNumber(int index){
    _questionNumber.value = index+1;
  }


}

