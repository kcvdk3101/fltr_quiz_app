import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/quiz_progress_bar.dart';
import 'package:quiz_app/screens/quiz/components/quiz_question_card.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access question controller
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      children: [
        SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill,),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(() => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: kSecondaryColor)
                        )
                      ]
                    )
                  ),
                )
              ),
              Divider(thickness: 2),
              Expanded(
                child: PageView.builder(
                  // Block swipe
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQuestionNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index],)
                )
              ),
            ],
          )
        )
      ],
    );
  }
}

