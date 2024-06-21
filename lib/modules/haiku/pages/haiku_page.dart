import 'package:bushidose/components/haiku_card_widget.dart';
import 'package:bushidose/modules/haiku/cubit/haiku_cubit.dart';
import 'package:bushidose/modules/haiku/pages/haiku_create_page.dart';
import 'package:bushidose/modules/haiku/pages/publish_page.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HaikuPage extends StatelessWidget {
  const HaikuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Create traditional Japanese haiku yourself or get inspired by the magic write option',
          style: AppTextStyles.styleF14W300,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 36),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HaikuCreatePage(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffB9B9B9),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/paper.svg'),
                    const SizedBox(width: 8),
                    Text(
                      'Create haiku',
                      style: AppTextStyles.styleF14W400(),
                    ),
                  ],
                ),
                const Icon(
                  Icons.add,
                  color: Color(0xffB9B9B9),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<HaikuCubit, HaikuState>(
            builder: (context, state) {
              if (state.haikuCreateModel.isEmpty) {
                return const SizedBox();
              } else {
                return ListView.builder(
                  itemCount: state.haikuCreateModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PublishPage(
                              newHaiku: state.haikuCreateModel[index],
                              isHome: true,
                            ),
                          ),
                        );
                      },
                      child: HaikuCardWidget(
                        onTapEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HaikuCreatePage(
                                haikuCreateModel: state.haikuCreateModel[index],
                                isChange: true,
                              ),
                            ),
                          );
                        },
                        haikuCreate: state.haikuCreateModel[index],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
