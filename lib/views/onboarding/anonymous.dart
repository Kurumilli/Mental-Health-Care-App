
import 'package:flutter_application_1/controllers/onboarding_controller.dart';
import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter_application_1/shared/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Anonymous extends GetView<OnboardingController> {
  const Anonymous({super.key})
  ;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/memphis.png',
                  fit: BoxFit.contain,
                ),
                Positioned(
                  left: SizeConfig.safeHorizontal! * 0.01,
                  top: SizeConfig.safeVertical! * 0.005,
                  child: BackButton(color: Colors.black),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.safeVertical! * 0.2),
                    child: SvgPicture.asset(
                      'assets/elements/anonymous.svg',
                      fit: BoxFit.contain,
                      height: SizeConfig.safeVertical! * 0.2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.03,
            ),
            Text(
              'Stay Anonymous',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontFamily: 'JekoBold',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.01,
            ),
            Text(
              "Select your username",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: CustomColors.appLightGrey,
                    fontFamily: 'JekoBold',
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeHorizontal! * .06,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontFamily: 'JekoBold',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeVertical! * 0.005,
                  ),
                  TextBox(
                    placeholder: "Enter your username",
                    controller: controller.anonymousName,
                  ),
                ],
              ),
            ),
            const Spacer(),
            RoundedButton(
              text: 'Continue',
              bgColor: CustomColors.appGreen,
              onClicked: () {
                controller.onSubmitAnonymousName();
              },
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
