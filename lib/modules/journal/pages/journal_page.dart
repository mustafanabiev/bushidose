import 'package:bushidose/models/journal_model.dart';
import 'package:bushidose/modules/dojo/cubit/dojo_cubit.dart';
import 'package:bushidose/modules/dojo/pages/learn_about_each_habit_paeg.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text:
                  'Celebrate your consistency and dedication to Samurai habits. ',
              style: AppTextStyles.styleF14W300,
              children: [
                TextSpan(
                  text: 'Learn about each habit',
                  style: AppTextStyles.styleF14W300.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearnAboutEachHabitPage(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Expanded(
            child: BlocBuilder<DojoCubit, DojoState>(
              builder: (context, state) {
                DateTime today = DateTime.now();
                DateTime sevenDaysAgo = today.subtract(const Duration(days: 7));

                final habitSelectionCount = <String, int>{};
                final habitWeeklyCount = <String, int>{};

                for (var journalModel in journalList) {
                  habitSelectionCount[journalModel.name] = 0;
                  habitWeeklyCount[journalModel.name] = 0;
                }
                state.dojoSelectMap.forEach((date, dojoSelectList) {
                  DateTime currentDate = DateTime.parse(date);
                  bool isInLastWeek = currentDate.isAfter(sevenDaysAgo) &&
                          currentDate.isBefore(today) ||
                      currentDate.isAtSameMomentAs(today);

                  for (var dojoSelectModel in dojoSelectList) {
                    if (dojoSelectModel.select) {
                      habitSelectionCount[dojoSelectModel.name] =
                          (habitSelectionCount[dojoSelectModel.name] ?? 0) + 1;
                      if (isInLastWeek) {
                        habitWeeklyCount[dojoSelectModel.name] =
                            (habitWeeklyCount[dojoSelectModel.name] ?? 0) + 1;
                      }
                    }
                  }
                });

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 147,
                  ),
                  itemCount: journalList.length,
                  itemBuilder: (context, index) {
                    final journalModel = journalList[index];
                    final selectedCount =
                        habitSelectionCount[nameJournal(journalModel.name)] ??
                            0;
                    final weeklyCount =
                        habitWeeklyCount[nameJournal(journalModel.name)] ?? 0;

                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFCFCFC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: 164,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$selectedCount',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 32,
                                      color: Color(0xff070417),
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                  ),
                                  const Text(
                                    'Days',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      color: Color(0xff7A7A7A),
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: selectedCount > 0
                                      ? const Color(0xffFDE998)
                                      : const Color(0xffE1E1E1),
                                ),
                                padding: const EdgeInsets.all(8),
                                child:
                                    SvgPicture.asset('assets/icons/check.svg'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            journalModel.name.toUpperCase(),
                            style: AppTextStyles.styleF14W700,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 14,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 3),
                                      width: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: index < weeklyCount
                                            ? const Color(0xffFDE998)
                                            : const Color(0xffE1E1E1),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Text(
                                '$weeklyCount/7',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  color: Color(0xff7A7A7A),
                                  fontWeight: FontWeight.w400,
                                  height: 3.2,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String nameJournal(String name) {
    switch (name) {
      case 'katana':
        return 'Katana practice';
      case 'exercise':
        return 'Physical exercise';
      default:
        return name;
    }
  }
}
