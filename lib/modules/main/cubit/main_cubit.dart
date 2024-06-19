import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(MainState(
          selectedText: 'Dojo',
          premium: false,
        )) {
    _loadPremiumState();
  }

  void change(String text) {
    emit(state.copyWith(selectedText: text));
  }

  void onTextTap(
    BuildContext context,
    String text,
    bool isPremium,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) {
    if (text == 'Haiku' && !isPremium) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Upgrade to Premium'),
            content: const Text(
              'To use this feature, you need to upgrade to a premium account.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  scaffoldKey.currentState?.openEndDrawer();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    emit(state.copyWith(selectedText: text));
  }

  void _loadPremiumState() async {
    final prefs = await SharedPreferences.getInstance();
    final isPremium = prefs.getBool('premium') ?? false;
    emit(state.copyWith(premium: isPremium));
  }

  void premium() async {
    emit(state.copyWith(premium: true));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('premium', true);
  }
}
