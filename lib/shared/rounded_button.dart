import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onClicked;

  const RoundedButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        elevation: 0,
        fixedSize: Size(
            SizeConfig.safeHorizontal! * .85, SizeConfig.safeVertical! * .065),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white, fontFamily: 'JekoBold'),
      ),
    );
  }
}
