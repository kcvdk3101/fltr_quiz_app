import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      color: Colors.deepPurpleAccent
                    )
                  ),
                  Text("Enter your information below"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      )
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(kDefaultPadding * .75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient, 
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text("Start a quiz", 
                        style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black)
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
