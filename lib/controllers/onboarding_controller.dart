import 'dart:developer'; // For proper logging
import 'package:flutter_application_1/services/firebase/firebase_functions.dart';
import 'package:flutter_application_1/shared/indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions();

  final _isChecked = false.obs;
  final _phone = ''.obs;
  final _genderBool = false.obs;

  get isChecked => _isChecked.value;
  set isChecked(value) => _isChecked.value = value;

  get phone => _phone.value;
  set phone(value) => _phone.value = value;

  get genderBool => _genderBool.value;
  set genderBool(value) => _genderBool.value = value;

  final TextEditingController dateInput = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController getPhone = TextEditingController();
  final TextEditingController priorityTask = TextEditingController();
  final TextEditingController anonymousName = TextEditingController();

  void handleCheckbox() {
    isChecked = !isChecked;
  }

  void onSubmitForm() async {
    if (name.text.isNotEmpty &&
        surname.text.isNotEmpty &&
        getPhone.text.isNotEmpty &&
        dateInput.text.isNotEmpty) {
      if (getPhone.text.length < 10) {
        Get.snackbar("Error", "Phone number should be of 10 digits");
      } else {
        Indicator.showLoading();
        String gender = isChecked ? 'Not Specified' : (genderBool ? 'Male' : 'Female');
        String phoneNumber = "$phone ${getPhone.text}";

        await _functions.storePersonalDetails(
          name.text, surname.text, phoneNumber, gender, dateInput.text,
        ).then((_) {
          name.clear();
          surname.clear();
          getPhone.clear();
          dateInput.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        });
      }
    } else {
      Get.snackbar("Error", "All Fields are required");
    }
  }

  void onSubmitPriorityTask() {
    if (priorityTask.text.isNotEmpty) {
      GetStorage().write("taskText", priorityTask.text);
      Get.offAllNamed('/main-screen', arguments: auth.currentUser);
      priorityTask.clear();
    } else {
      Get.snackbar("Can't Submit!", "Please set your priority task for the day!");
    }
  }

  void onSubmitAnonymousName() async {
    if (anonymousName.text.isNotEmpty) {
      Indicator.showLoading();
      await _functions.storeAnonymousName(anonymousName.text).then((_) {
        anonymousName.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      });
    } else {
      Get.snackbar("Can't continue!", "Please select a name for yourself");
    }
  }

  void handleDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (pickedDate != null) {
      dateInput.text = DateFormat.yMMMMd().format(pickedDate);
    } else {
      log("Date is not selected");
    }
  }
}
