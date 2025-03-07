import 'package:flutter_application_1/controllers/survey_controller.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  final String svgPath;
  final Widget child0;
  final Widget child1;
  final Widget child2;
  final Widget child3;
  final VoidCallback onTap0;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  const QuestionScreen({
    super.key,
    required this.svgPath,
    required this.child0,
    required this.child1,
    required this.child2,
    required this.child3,
    required this.onTap0,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeVertical! * 0.01,
        ),
        Center(
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.contain,
            // height: SizeConfig.safeVertical! * 0.1,
            width: SizeConfig.safeHorizontal! * 0.85,
          ),
        ),
        SizedBox(
          height: SizeConfig.safeVertical! * 0.07,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
isSelected: SurveyController.to.getCardSelection(0),
                onClicked: onTap0,
                child: Center(
                  child: child0,
                ),
              ),
            ),
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.getCardSelection(1),
                onClicked: onTap1,
                child: Center(
                  child: child1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.safeVertical! * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.getCardSelection(2),
                onClicked: onTap2,
                child: Center(
                  child: child2,
                ),
              ),
            ),
            Obx(
              () => ShadowBox(
                ht: SizeConfig.safeVertical! * .18,
                wd: SizeConfig.safeVertical! * .18,
                isSelected: SurveyController.to.getCardSelection(3),
                onClicked: onTap3,
                child: Center(
                  child: child3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}