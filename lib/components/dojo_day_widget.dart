import 'package:bushidose/models/dojo_select_model.dart';
import 'package:bushidose/modules/dojo/cubit/dojo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:bushidose/utils/data_util.dart' as date_util;

class DojoCallendarWidget extends StatefulWidget {
  const DojoCallendarWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  @override
  State<DojoCallendarWidget> createState() => _DojoCallendarWidgetState();
}

class _DojoCallendarWidgetState extends State<DojoCallendarWidget> {
  late ScrollController scrollController;
  List<DateTime> currentMonthList = [];
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 50.0 * currentDateTime.day);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 126,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (context, index) {
          DateTime date = currentMonthList[index];
          DateTime now = DateTime.now();
          bool isToday = date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;
          bool isFutureDate = date.isAfter(now);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: () {
                if (!isFutureDate) widget.onDateSelected(date);
              },
              child: Opacity(
                opacity: 1.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: date.day != widget.selectedDate.day
                        ? const Color(0xffFCFCFC)
                        : AppColors.textBlue,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isToday
                          ? AppColors.textBlue
                          : const Color(0xffE6E6E6),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          DateFormat('EEE').format(date),
                          style: date.day != widget.selectedDate.day
                              ? AppTextStyles.styleF12W400()
                              : AppTextStyles.styleF12W400(
                                  color: const Color(0xffF7F7F7),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            date.day.toString(),
                            style: date.day != widget.selectedDate.day
                                ? AppTextStyles.styleF24W700()
                                : AppTextStyles.styleF24W700(
                                    color: const Color(0xffF7F7F7),
                                  ),
                          ),
                        ),
                        Text(
                          DateFormat.MMM().format(date),
                          style: date.day != widget.selectedDate.day
                              ? AppTextStyles.styleF12W400()
                              : AppTextStyles.styleF12W400(
                                  color: const Color(0xffF7F7F7),
                                ),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<DojoCubit, DojoState>(
                          builder: (context, state) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(date);
                            List<DojoSelectModel> dojoSelectList =
                                state.dojoSelectMap[formattedDate] ?? [];
                            int selectedCount = dojoSelectList
                                .where((item) => item.select)
                                .length;
                            return SvgPicture.asset(
                              'assets/icons/${showIcon(selectedCount)}.svg',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String showIcon(int value) {
    switch (value) {
      case 1:
        return 'moon_1';
      case 2:
        return 'moon_2';
      case 3:
        return 'moon_3';
      case 4:
        return 'moon_4';
      case 5:
        return 'moon_5';
      case 6:
        return 'moon_6';
      case 7:
        return 'moon_7';
      case 8:
        return 'moon_all';
      default:
        return 'moon';
    }
  }
}
