import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => _questionController.nextQuestion(), 
            child: Text(
              "Skip", 
              style: TextStyle(color: Colors.white),
            )
          )
        ],
      ),
      body: Body(),
    );
  }
}

