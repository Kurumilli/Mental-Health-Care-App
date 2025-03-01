
import 'package:flutter_application_1/controllers/tasklist_controller.dart';
import 'package:get/get.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TaskListController>(TaskListController());
  }
}
