import 'package:flutter_application_1/controllers/mainscreen_controller.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter_application_1/shared/bottom_bar_widget.dart';
import 'package:flutter_application_1/views/main/balance_page.dart';
import 'package:flutter_application_1/views/main/home_page.dart';
import 'package:flutter_application_1/views/main/profile_page.dart';
import 'package:flutter_application_1/views/main/specialist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({super.key});
  // Define pages once in the constructor to avoid unnecessary re-creation.
  final List<Widget> pages = [
    HomePage(),
    BalancePage(),
    SpecialistPage(),
    ProfilePage(user: Get.arguments ?? {}), // Prevent null errors
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Obx(() => Scaffold(
          extendBody: true,
          body: pages[controller.tabIndex],
          bottomNavigationBar: BottomBarWidget(
            index: controller.tabIndex,
            onChangedTab: controller.changeTabIndex,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.chat_bubble),
            onPressed: () {
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ));
  }
}