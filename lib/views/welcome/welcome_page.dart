import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/rich_text.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.safeHorizontal! * 0.1,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          height: SizeConfig.safeVertical! * 0.14,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeVertical! * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          'assets/text/hero.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.safeVertical! * 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                RoundedButton(
                  text: 'Get Started',
                  bgColor: Colors.black,
                  onClicked: () {
                    Get.offNamed("/sign-up");
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.03,
                ),
                RichTextEditor(
                    primaryText: already,
                    secondaryText: " Log in",
                    onClicked: () {
                      Get.offNamed("/log-in");
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}