import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controllers/signup_controller.dart';
import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/rich_text.dart';
import 'package:flutter_application_1/shared/rounded_button.dart';
import 'package:flutter_application_1/shared/textbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupPage extends GetView<SignUpController> {
  const SignupPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow keyboard to adjust layout
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
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontFamily: 'JekoBold',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Make page scrollable
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeHorizontal! * .06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.safeVertical! * 0.02),
                
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.005),
                TextBox(
                  placeholder: 'Enter your email',
                  controller: controller.email,
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.02),

                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontFamily: 'JekoBold',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.005),
                TextBox(
                  placeholder: 'Enter your password',
                  isPassword: true,
                  controller: controller.password,
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.02),
                
                TextBox(
                  placeholder: 'Confirm your password',
                  isPassword: true,
                  controller: controller.confirmPass,
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.05),
                
                RoundedButton(
                  text: 'Continue',
                  bgColor: CustomColors.appGreen,
                  onClicked: () {
                    controller.onCreateAccount();
                  },
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.02),

                Center(
                  child: Text(
                    'OR',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBold',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.02),

                RoundedButton(
                  text: 'Continue with Google',
                  bgColor: Colors.black,
                  onClicked: () {
                    controller.signUpWithGoogle();
                  },
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.03),

                Center(
                  child: RichTextEditor(
                    primaryText: already,
                    secondaryText: " Log in",
                    onClicked: () {
                      Get.toNamed("/log-in");
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.05),

                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you accept the\n',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: CustomColors.appDarkGrey,
                                fontFamily: 'JekoBold',
                              ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: CustomColors.appDarkGrey,
                                fontFamily: 'JekoBold',
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrl(Uri.parse('https://www.google.com'));
                            },
                        ),
                        TextSpan(
                          text: ' and ',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: CustomColors.appDarkGrey,
                                fontFamily: 'JekoBold',
                              ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: CustomColors.appDarkGrey,
                                fontFamily: 'JekoBold',
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrl(Uri.parse('https://www.google.com'));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
