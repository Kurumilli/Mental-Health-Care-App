import 'package:flutter_application_1/services/custom_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextEditor extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onClicked;

  const RichTextEditor({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontFamily: 'JekoBold',
                ),
          ),
          TextSpan(
            text: secondaryText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: CustomColors.appGreen,
                  fontFamily: 'JekoBold',
                ),
            recognizer: TapGestureRecognizer()..onTap = onClicked,
          ),
        ],
      ),
    );
  }
}
