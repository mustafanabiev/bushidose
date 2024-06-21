import 'package:bushidose/components/dojo_day_widget.dart';
import 'package:bushidose/components/dojo_select_widget.dart';
import 'package:bushidose/modules/dojo/pages/learn_about_each_habit_paeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bushidose/models/dojo_select_model.dart';
import 'package:bushidose/modules/dojo/cubit/dojo_cubit.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';

class DojoPage extends StatefulWidget {
  const DojoPage({super.key});

  @override
  State<DojoPage> createState() => _DojoPageState();
}

class _DojoPageState extends State<DojoPage> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DojoCubit>().selectDate(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text:
                    'A daily samurai habit tracker to celebrate your consistency and dedication. ',
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
                            builder: (context) =>
                                const LearnAboutEachHabitPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
          BlocBuilder<DojoCubit, DojoState>(
            builder: (context, state) {
              String dateString = selectedDate.toString().split(' ')[0];
              List<DojoSelectModel> dojoSelectList =
                  state.dojoSelectMap[dateString] ?? [];
              return Column(
                children: [
                  DojoCallendarWidget(
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                      context.read<DojoCubit>().selectDate(date);
                    },
                  ),
                  const SizedBox(height: 16),
                  if (dojoSelectList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dojoSelectList.length,
                      itemBuilder: (context, index) {
                        return DojoSelectWidget(
                          index: index,
                          dojoSelectModel: dojoSelectList[index],
                          onToggleSelect: () {
                            context
                                .read<DojoCubit>()
                                .toggleSelect(selectedDate, index);
                          },
                        );
                      },
                    )
                  else
                    const SizedBox(
                      child: Text('data'),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
