import 'package:bushidose/models/haiku_create_model.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HaikuCardWidget extends StatelessWidget {
  const HaikuCardWidget({super.key, required this.haikuCreate});

  final HaikuCreateModel haikuCreate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.fromLTRB(15, 14, 14, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: MemoryImage(haikuCreate.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/icons/edit.svg'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                haikuCreate.title.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  color: AppColors.textBlue,
                  fontWeight: FontWeight.w700,
                  height: 16.94 / 14.0,
                ),
              ),
              Text(
                haikuCreate.date,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12.0,
                  color: Color(0xff7A7A7A),
                  fontWeight: FontWeight.w400,
                  height: 16.0 / 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
