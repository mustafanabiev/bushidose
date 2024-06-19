part of 'main_cubit.dart';

class MainState {
  MainState({
    required this.selectedText,
    required this.premium,
  });

  final bool premium;
  final String selectedText;

  MainState copyWith({
    bool? premium,
    String? selectedText,
  }) {
    return MainState(
      premium: premium ?? this.premium,
      selectedText: selectedText ?? this.selectedText,
    );
  }
}
