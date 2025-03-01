import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarWidget extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const BottomBarWidget({
    required this.index,
    required this.onChangedTab,
    super.key, // key is optional and should be passed to super
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // If you don't need opacity, you can remove this
    final placeholder = SizedBox.shrink(); // Use SizedBox if you just need space

    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            svgIconPath: 'assets/elements/home.svg',
            title: 'Home',
            context: context,
          ),
          buildTabItem(
            index: 1,
            svgIconPath: 'assets/elements/balance.svg',
            title: 'Balance',
            context: context,
          ),
          placeholder, // If not needed, you can remove it
          buildTabItem(
            index: 2,
            svgIconPath: 'assets/elements/specialist.svg',
            title: 'Specialists',
            context: context,
          ),
          buildTabItem(
            index: 3,
            svgIconPath: 'assets/elements/profile.svg',
            title: 'Profile',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required String svgIconPath,
    required String title,
    required BuildContext context,
  }) {
    Color tabColor = index == this.index ? Colors.black : CustomColors.appLightGrey;

    return Expanded(
      child: InkWell(
        onTap: () => onChangedTab(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.safeVertical! * 0.01,
            ),
            SvgPicture.asset(
              svgIconPath,
              fit: BoxFit.contain,
              height: SizeConfig.safeVertical! * 0.03,
              colorFilter: ColorFilter.mode(tabColor, BlendMode.srcIn),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.005,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: tabColor,
                    fontFamily: 'JekoBold',
                  ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.008,
            ),
          ],
        ),
      ),
    );
  }
}
