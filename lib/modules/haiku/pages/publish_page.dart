import 'package:bushidose/models/haiku_create_model.dart';
import 'package:bushidose/modules/haiku/cubit/haiku_cubit.dart';
import 'package:bushidose/modules/main/cubit/main_cubit.dart';
import 'package:bushidose/modules/main/pages/main_page.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({
    super.key,
    this.oldHaiku,
    required this.newHaiku,
    required this.isChange,
  });

  final HaikuCreateModel? oldHaiku;
  final HaikuCreateModel newHaiku;
  final bool isChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: MemoryImage(newHaiku.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 64, 15, 15),
          child: Column(
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
              const SizedBox(height: 68),
              Text(
                newHaiku.title.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textBlue,
                  fontWeight: FontWeight.w700,
                  height: 16.94 / 14,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 60),
              Text(
                newHaiku.line1,
                style: const TextStyle(
                  fontFamily: 'Papyrus',
                  fontSize: 16,
                  color: Color(0XFF070417),
                  fontWeight: FontWeight.w400,
                  height: 22.4 / 16,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 18),
              Text(
                newHaiku.line2,
                style: const TextStyle(
                  fontFamily: 'Papyrus',
                  fontSize: 16,
                  color: Color(0XFF070417),
                  fontWeight: FontWeight.w400,
                  height: 22.4 / 16,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 18),
              Text(
                newHaiku.line3,
                style: const TextStyle(
                  fontFamily: 'Papyrus',
                  fontSize: 16,
                  color: Color(0XFF070417),
                  fontWeight: FontWeight.w400,
                  height: 22.4 / 16,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 47),
              IconButton(
                onPressed: () {
                  if (isChange) {
                    if (oldHaiku != null) {
                      context.read<HaikuCubit>().updateHaiku(
                            oldHaiku!,
                            newHaiku,
                          );
                      context.read<MainCubit>().change('Haiku');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                        (route) => false,
                      );
                    }
                  } else {
                    context.read<HaikuCubit>().createNew(newHaiku);
                    context.read<MainCubit>().change('Haiku');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) => false,
                    );
                  }
                },
                icon: SvgPicture.asset('assets/icons/share.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
