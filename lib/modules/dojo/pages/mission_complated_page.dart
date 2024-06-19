import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MissionComplatedPage extends StatelessWidget {
  const MissionComplatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/icons/Group 1.svg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset('assets/icons/Group 17.svg'),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.23),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/ninsia.png'),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.59),
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Image.asset('assets/images/Vector.png'),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        const SizedBox(height: 55),
                        const Text(
                          '任務終了',
                          style: TextStyle(
                            fontFamily: 'Electroharmonix',
                            fontSize: 40.0,
                            color: AppColors.textBlue,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Mission completed!\nCome back on track tomorrow',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            color: AppColors.textBlue,
                            fontWeight: FontWeight.w400,
                            height: 18 / 16,
                            letterSpacing: -0.03 * 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: SvgPicture.asset('assets/icons/close.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
