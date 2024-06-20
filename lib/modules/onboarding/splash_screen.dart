import 'package:bushidose/modules/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false,
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.17,
            ),
            child: SvgPicture.asset('assets/icons/splash_red.svg'),
          ),
          SvgPicture.asset(
            'assets/icons/splash_top.svg',
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: SvgPicture.asset('assets/icons/bushi dose.svg'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              'assets/icons/splash_bottom.svg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
