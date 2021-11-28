import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill,),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2,),
                  Text("Let's play Quiz", 
                    style: TextStyle(
                      fontSize: 40, 
                      color: Colors.white
                    )
                  ),
                  Text("Enter your information below"),
                  Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: kDefaultPadding / 2),
                      padding: EdgeInsets.all(kDefaultPadding * .75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient, 
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text("Start a quiz", 
                        style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kBlackColor)
                      ),
                    ),
                  ),
                  Spacer(flex: 2,)
                ],
              ),
            )
          )
        ],        
      )
    );
  }
}
