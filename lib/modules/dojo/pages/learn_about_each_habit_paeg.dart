import 'package:bushidose/constants/samurai_habits.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LearnAboutEachHabitPage extends StatelessWidget {
  const LearnAboutEachHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.square(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/icons/close.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: 54),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Text(
                        '8 samurai habits explained'.toUpperCase(),
                        style: AppTextStyles.styleF14W700,
                      ),
                      const SizedBox(height: 36),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: samuraiHabits.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    samuraiHabits[index].name.toUpperCase(),
                                    style: AppTextStyles.styleF14W700,
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(
                                    'assets/icons/paper.svg',
                                    color: AppColors.textRed,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                samuraiHabits[index].description,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff070417),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 25.52 / 16,
                                  letterSpacing: -0.01,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
