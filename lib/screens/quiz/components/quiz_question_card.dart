import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/components/quiz_option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: kBlackColor),      
          ),
          ...List.generate(question.options.length, (index) => 
            Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAnswer(question, index),
            )
          )
        ],
      ),
    );
  }
}