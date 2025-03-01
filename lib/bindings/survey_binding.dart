import 'package:flutter_application_1/controllers/survey_controller.dart';
import 'package:get/get.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SurveyController>(SurveyController());
  }
}