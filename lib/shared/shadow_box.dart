import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  final double ht;
  final double wd;
  final bool isSelected;
  final bool isShadow;
  final Widget child;
  final VoidCallback onClicked;

  const ShadowBox({
    super.key,
    required this.ht,
    required this.wd,
    this.isSelected = false,
    this.isShadow = true,
    required this.child,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: ht,
        width: wd,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: isSelected ? CustomColors.appGreen : Colors.transparent,
              width: 3.0),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF7C7C7C).withValues(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.28),
              spreadRadius: isShadow ? 5 : 1,
              blurRadius: isShadow ? 50 : 2,
              offset: isShadow
                  ? Offset(10, 10)
                  : Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}