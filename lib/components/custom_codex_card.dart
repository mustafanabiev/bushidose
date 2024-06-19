import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCodexCard extends StatelessWidget {
  const CustomCodexCard({
    super.key,
    required this.text,
    required this.text2,
    required this.text3,
  });

  final String text;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 14),
      decoration: BoxDecoration(
        color: const Color(0xffFFCD03),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Color(0xffDF0000),
                fontWeight: FontWeight.w500,
                height: 21.78 / 18,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          const SizedBox(height: 51),
          Text(
            text2.toUpperCase(),
            style: AppTextStyles.styleF14W700,
          ),
          Text(
            text3.toUpperCase(),
            style: AppTextStyles.styleF14W700,
          ),
        ],
      ),
    );
  }
}
