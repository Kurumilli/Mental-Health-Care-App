import 'package:flutter_application_1/controllers/survey_controller.dart';
import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/question_screen.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: SizeConfig.safeVertical! * 0.12,
        flexibleSpace: SafeArea(
          child: Center(
            child: Obx(
              () => Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 60, // Set the width of the progress circle
                    height: 60,
                    child: CircularProgressIndicator(
                      value: controller.progressNum / 9, // Normalize the progress
                      backgroundColor: CustomColors.appLightGrey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5,
                    ),
                  ),
                  Text(
                    "${controller.progressNum}/9",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBlack',
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => QuestionScreen(
                child0: Text(
                  'Not\nat all',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                child1: Text(
                  'On\nSeveral\ndays',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                child2: Center(
                  child: Text(
                    'More\nthan half\nthe days',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBlack',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                child3: Text(
                  'Nearly\nevery day',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBlack',
                      ),
                  textAlign: TextAlign.center,
                ),
                svgPath: 'assets/text/question-${controller.progressNum}.svg',
                onTap0: () => controller.card0Selected(),
                onTap1: () => controller.card1Selected(),
                onTap2: () => controller.card2Selected(),
                onTap3: () => controller.card3Selected(),
              ),
            ),
            Spacer(),
            RoundedButton(
              bgColor: Colors.black,
              text: 'submit',
              onClicked: () => controller.updateProgressNumber(),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
