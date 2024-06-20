import 'package:bushidose/components/drawer_page.dart';
import 'package:bushidose/components/text_widget.dart';
import 'package:bushidose/modules/main/cubit/main_cubit.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:bushidose/theme/app_text_styles.dart';
import 'package:bushidose/utils/select_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bg,
      endDrawer: const DrawerPage(),
      body: SafeArea(
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Padding(
              padding: state.selectedText != 'Dojo'
                  ? const EdgeInsets.all(15)
                  : const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Padding(
                    padding: state.selectedText != 'Dojo'
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context.read<MainCubit>().onTextTap(
                                context,
                                'Dojo',
                                true,
                                _scaffoldKey,
                              ),
                          child: TextWidget(
                            text: 'Dojo',
                            textStyle: state.selectedText == 'Dojo'
                                ? AppTextStyles.styleF22W700
                                : AppTextStyles.styleF14W700,
                          ),
                        ),
                        BlocBuilder<MainCubit, MainState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () => context.read<MainCubit>().onTextTap(
                                    context,
                                    'Haiku',
                                    state.premium,
                                    _scaffoldKey,
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: 'Haiku',
                                    textStyle: state.selectedText == 'Haiku'
                                        ? AppTextStyles.styleF22W700
                                        : AppTextStyles.styleF14W700,
                                  ),
                                  !state.premium
                                      ? SvgPicture.asset(
                                          'assets/icons/lock_icon.svg',
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () => context.read<MainCubit>().onTextTap(
                                context,
                                'Journal',
                                true,
                                _scaffoldKey,
                              ),
                          child: TextWidget(
                            text: 'Journal',
                            textStyle: state.selectedText == 'Journal'
                                ? AppTextStyles.styleF22W700
                                : AppTextStyles.styleF14W700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.read<MainCubit>().onTextTap(
                                context,
                                'Codex',
                                true,
                                _scaffoldKey,
                              ),
                          child: TextWidget(
                            text: 'Codex',
                            textStyle: state.selectedText == 'Codex'
                                ? AppTextStyles.styleF22W700
                                : AppTextStyles.styleF14W700,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon:
                                  SvgPicture.asset('assets/icons/settings.svg'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: selectPages(state.selectedText)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
