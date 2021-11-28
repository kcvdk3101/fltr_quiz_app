import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 2),
        borderRadius: BorderRadius.circular(50)
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          double timer = (controller.animation.value * 10);

          return Stack(
            children: [
              // LayoutBuider provide the available space for the container
              // constraints.maxWidth need for animation
              LayoutBuilder(builder: (context, constraints) => 
                Container(
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50)
                  ),
                )
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding - 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${timer.toInt()} ${(timer.toInt()) > 1 ? "seconds" : "second"}"),
                      SvgPicture.asset("assets/icons/clock.svg")
                    ],
                  ),
                )
              )
            ],
          );
        }
      ),
    );
  }
}