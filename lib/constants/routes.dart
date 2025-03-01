import 'package:flutter_application_1/views/onboarding/anonymous.dart';
import 'package:flutter_application_1/views/onboarding/onboarding.dart';
import 'package:flutter_application_1/views/onboarding/personal_details.dart';
import 'package:flutter_application_1/views/onboarding/priorityTask_page.dart';
import 'package:flutter_application_1/views/welcome/auth_page.dart';
import 'package:flutter_application_1/views/welcome/email_verify.dart';
import 'package:flutter_application_1/views/welcome/forgot_password.dart';
import 'package:flutter_application_1/views/welcome/login.dart';
import 'package:flutter_application_1/views/welcome/reset_password.dart';
import 'package:flutter_application_1/views/welcome/signup.dart';
import 'package:flutter_application_1/views/welcome/welcome_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object

  static final routes = [
    GetPage(
        name: '/auth',
        page: () => AuthPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/',
        page: () => const WelcomePage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/sign-up',
        page: () => const SignupPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/log-in',
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/forgot-password',
        page: () => const ForgotPassword(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/email-verify',
        page: () => const EmailVerify(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/reset-password',
        page: () => const ResetPassword(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/onboarding',
        page: () => const OnBoarding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/personal-details',
        page: () => PersonalDetails(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/anonymous',
        page: () => const Anonymous(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: '/priority-task',
        page: () => const PriorityTaskPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}