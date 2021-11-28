import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill,),
          Column(
            children: [
              Spacer(flex: 3,),
              Text(
                "Score",
                style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_questionController.numOfCorrectAnswer}/${_questionController.questions.length}",
                style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () => Get.to(WelcomeScreen()),
                child: Text('Back to Home Screen'),
              ),
              Spacer(flex: 3,),

            ],
          )
        ],
      ),
    );
  }
}