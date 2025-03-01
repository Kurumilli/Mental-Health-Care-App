import 'package:flutter_application_1/controllers/specialist_controller.dart';
import 'package:get/get.dart';

class SpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SpecialistController>(SpecialistController());
  }
}