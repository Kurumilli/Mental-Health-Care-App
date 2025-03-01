import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;

  const TextBox({
    super.key,
    required this.placeholder,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      obscureText: isPassword,
      maxLength: 100,
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontFamily: 'JekoRegular',
          ),
      decoration: InputDecoration(
        counterText: '',
        filled: false,
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeVertical! * .02,
          horizontal: SizeConfig.safeHorizontal! * .04,
        ),
        hintText: placeholder,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: CustomColors.appDarkGrey,
              fontFamily: 'JekoRegular',
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.appLightGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.appLightGrey),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
