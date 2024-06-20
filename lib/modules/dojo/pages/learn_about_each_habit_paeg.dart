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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8 samurai habits explained'.toUpperCase(),
                      style: AppTextStyles.styleF14W700,
                    ),
                    const SizedBox(height: 36),
                    Row(
                      children: [
                        Text(
                          'Haiku'.toUpperCase(),
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
                    const Text(
                      'Writing haiku, three-line poems that capture the beauty of the moment  and a connection with nature, fosters mindfulness and an appreciation  of the present moment. It encourages you to observe and reflect on  nature, enhancing your awareness and creativity. For samurais, writing  haiku was a form of artistic expression and mental discipline. It  allowed them to cultivate a calm and focused mind, essential for  maintaining clarity and composure in battle.',
                      style: TextStyle(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
