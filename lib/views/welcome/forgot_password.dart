
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter_application_1/shared/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetView<LoginController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.safeVertical! * 0.17),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/memphis.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, SizeConfig.safeVertical! * 0.01),
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeHorizontal! * .06,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  forgotPasswordSubtitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: CustomColors.appLightGrey,
                        fontFamily: 'JekoBold',
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
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
                placeholder: 'Enter your email',
                controller: controller.mailForResetPass,
              ),
              const Spacer(),
              RoundedButton(
                text: "Submit",
                bgColor: CustomColors.appGreen,
                onClicked: () {
                  controller.resetPassword();
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
