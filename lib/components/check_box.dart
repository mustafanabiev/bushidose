import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
  });
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: value ? const Color(0xffFEE067) : const Color(0xffDEDEDE),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: value ? const Color(0xffFEE067) : const Color(0xffDEDEDE),
        ),
      ),
      child: value ? SvgPicture.asset('assets/icons/check_on.svg') : null,
    );
  }
}
