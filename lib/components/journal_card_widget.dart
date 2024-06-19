import 'package:bushidose/models/journal_model.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JournalCardWidget extends StatelessWidget {
  const JournalCardWidget({
    super.key,
    required this.journalModel,
  });

  final JournalModel journalModel;

  @override
  Widget build(BuildContext context) {
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
                    journalModel.day,
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
                  color: journalModel.week.where((week) => week).isNotEmpty
                      ? const Color(0xffFDE998)
                      : const Color(0xffE1E1E1),
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('assets/icons/check.svg'),
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
                  itemCount: journalModel.week.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 3),
                      width: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: journalModel.week[index]
                            ? const Color(0xffFDE998)
                            : const Color(0xffE1E1E1),
                      ),
                    );
                  },
                ),
              ),
              Text(
                '${journalModel.week.where((week) => week).length}/${journalModel.week.length}',
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
  }
}
