import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// Get package for state management
// Animation for progress bar
class QuestionController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController _animationController;

  Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map((question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']
      ),
    ).toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  // RxJs
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

   int _numOfCorrectAnswer = 0;
  int get numOfCorrectAnswer => this._numOfCorrectAnswer;

  // Call when widget is allocated memory
  @override
  void onInit() {
    _animationController = 
      AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)..addListener(() {update();});
    
    // start our animations
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    super.onInit();
  }

  // Call function before the Controller is detected the memory
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numOfCorrectAnswer += 1;
    }

    // Stop the counter
    _animationController.stop();
    update();

    // Delay 3s for the next question
    Future.delayed(Duration(seconds: 2), (){
      nextQuestion();
    });
  }

  void nextQuestion() {
   if (_questionNumber.value == _questions.length) {
     // Get package provide simple way to navigate another page
      Get.to(ScoreScreen());
      return;
   }

   _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.ease);
      
      // Reset counter
      _animationController.reset();
      // Start it again
      _animationController.forward().whenComplete(nextQuestion);
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}