import 'package:flutter_application_1/controllers/survey_controller.dart';
import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/question_screen.dart';

class NightCheckInScreen extends GetView<SurveyController> {
  const NightCheckInScreen({super.key});

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
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      value: controller.nightProgressNum / 6, // Normalize progress
                      backgroundColor: CustomColors.appLightGrey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5,
                    ),
                  ),
                  Text(
                    "${controller.nightProgressNum}/6",
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
                child0: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-0.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child1: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-1.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child2: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-2.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                child3: SvgPicture.asset(
                  'assets/elements/object-${controller.nightProgressNum}-3.svg',
                  fit: BoxFit.contain,
                  height: SizeConfig.safeVertical! * 0.11,
                ),
                svgPath:
                    'assets/text/night-question-${controller.nightProgressNum}.svg',
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
              onClicked: () => controller.updateNightProgressNumber(),
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
