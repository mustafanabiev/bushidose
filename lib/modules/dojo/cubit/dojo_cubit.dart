import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bushidose/models/dojo_select_model.dart';

part 'dojo_state.dart';

class DojoCubit extends Cubit<DojoState> {
  DojoCubit()
      : super(DojoState(
          dojoSelectMap: {
            DateTime.now().toString().split(' ')[0]:
                _deepCopyList(dojoSelectList),
          },
          selectedDate: DateTime.now().toString().split(' ')[0],
        )) {
    _loadFromPrefs();
  }

  static List<DojoSelectModel> _deepCopyList(
      List<DojoSelectModel> originalList) {
    return originalList
        .map((item) => DojoSelectModel(
              icon: item.icon,
              name: item.name,
              select: item.select,
            ))
        .toList();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('dojoState', jsonEncode(state.toJson()));
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('dojoState');
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final DojoState loadedState = DojoState.fromJson(jsonMap);
      emit(loadedState);
    }
  }

  void selectDate(DateTime date) {
    DateTime now = DateTime.now();
    String dateString = date.toString().split(' ')[0];

    if (date.isAfter(now)) return;

    if (!state.dojoSelectMap.containsKey(dateString)) {
      state.dojoSelectMap[dateString] = _deepCopyList(dojoSelectList);
    }
    emit(DojoState(
      dojoSelectMap: Map.from(state.dojoSelectMap),
      selectedDate: dateString,
    ));
    _saveToPrefs();
  }

  // void toggleSelect(int index) {
  //   String selectedDate = state.selectedDate;
  //   List<DojoSelectModel> updatedList =
  //       List.from(state.dojoSelectMap[selectedDate]!);
  //   DojoSelectModel currentItem = updatedList[index];
  //   DojoSelectModel updatedItem = DojoSelectModel(
  //     icon: currentItem.icon,
  //     name: currentItem.name,
  //     select: !currentItem.select,
  //   );
  //   updatedList[index] = updatedItem;
  //   state.dojoSelectMap[selectedDate] = updatedList;
  //   emit(DojoState(
  //     dojoSelectMap: Map.from(state.dojoSelectMap),
  //     selectedDate: selectedDate,
  //   ));
  //   _saveToPrefs();
  // }
  void toggleSelect(DateTime date, int index) {
    String dateString = date.toString().split(' ')[0];
    List<DojoSelectModel> updatedList =
        List.from(state.dojoSelectMap[dateString]!);
    DojoSelectModel currentItem = updatedList[index];
    DojoSelectModel updatedItem = DojoSelectModel(
      icon: currentItem.icon,
      name: currentItem.name,
      select: !currentItem.select,
    );
    updatedList[index] = updatedItem;
    state.dojoSelectMap[dateString] = updatedList;
    emit(DojoState(
      dojoSelectMap: Map.from(state.dojoSelectMap),
      selectedDate: dateString,
    ));
    _saveToPrefs();
  }
}

List<DojoSelectModel> dojoSelectList = [
  const DojoSelectModel(
    icon: 'paper',
    name: 'Haiku',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'meditation',
    name: 'Meditation',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'katana',
    name: 'Katana practice',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'exercise',
    name: 'Physical exercise',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'bath',
    name: 'Hot bath',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'tea',
    name: 'Green tea',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'posture',
    name: 'Posture',
    select: false,
  ),
  const DojoSelectModel(
    icon: 'bed',
    name: 'Sleep',
    select: false,
  ),
];
