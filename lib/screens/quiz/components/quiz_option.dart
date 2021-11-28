import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.press
  }) : super(key: key);
  
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        Color getRightColor() {
          final isCorrectAnwser = index == controller.correctAnswer;
          final isSelected = index == controller.selectedAnswer;
          final checkedAnswer = controller.selectedAnswer != controller.correctAnswer;
          final isNotCorrectAnswer = isSelected && checkedAnswer;

          if (controller.isAnswered) {
            if (isCorrectAnwser) return kGreenColor;
            if (isNotCorrectAnswer) return kRedColor;
          }

          return kGrayColor;
        }

        IconData getRightIcon() {
          return getRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getRightColor()),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $text",
                  style: TextStyle(color: getRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getRightColor() == kGrayColor ? Colors.transparent : getRightColor(),
                    border: Border.all(color: getRightColor()),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: getRightIcon() == kGrayColor ? null:  Icon(getRightIcon(), size: 16,),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}