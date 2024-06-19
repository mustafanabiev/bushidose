import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PremiumTextWidget extends StatelessWidget {
  const PremiumTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.textBlue,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 23.44 / 20,
      ),
    );
  }
}
