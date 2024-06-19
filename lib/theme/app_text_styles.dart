import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static styleF12W400({Color? color}) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        color: color ?? AppColors.textBlue,
        fontWeight: FontWeight.w400,
        height: 14.52 / 12,
        textBaseline: TextBaseline.alphabetic,
      );
  static const styleF14W700 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.textBlue,
    fontWeight: FontWeight.w700,
    height: 16.94 / 14,
    textBaseline: TextBaseline.alphabetic,
  );

  static const styleF14W300 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColors.textGrey,
    fontWeight: FontWeight.w300,
    height: 16 / 14,
    textBaseline: TextBaseline.alphabetic,
  );
  static styleF14W400({Color? color}) => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: color ?? const Color(0xffB9B9B9),
        fontWeight: FontWeight.w400,
        height: 16 / 14,
        textBaseline: TextBaseline.alphabetic,
      );
  static const styleF22W700 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    color: AppColors.textRed,
    fontWeight: FontWeight.w700,
    height: 26.63 / 22,
    textBaseline: TextBaseline.alphabetic,
  );
  static styleF24W700({Color? color}) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 24,
        color: color ?? AppColors.textBlue,
        fontWeight: FontWeight.w700,
        height: 29.05 / 24,
        textBaseline: TextBaseline.alphabetic,
      );
}
