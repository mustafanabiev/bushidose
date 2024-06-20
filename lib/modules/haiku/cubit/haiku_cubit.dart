import 'dart:typed_data';

import 'package:bushidose/models/haiku_create_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'haiku_state.dart';

class HaikuCubit extends Cubit<HaikuState> {
  HaikuCubit() : super(HaikuState(haikuCreateModel: [])) {
    _loadHaikus();
  }

  void saveImage(Uint8List image) {
    emit(state.copyWith(image: image));
  }

  void saveImageCount(int? count) {
    emit(state.copyWith(selectedImageIndex: count));
  }

  void createNew(HaikuCreateModel haikuCreateModel) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel)
      ..add(haikuCreateModel);
    saveList(stateHaikus);
    _saveHaikus(stateHaikus);
  }

  void deleteHaiku(HaikuCreateModel haikuCreateModel) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel)
      ..remove(haikuCreateModel);
    saveList(stateHaikus);
    _saveHaikus(stateHaikus);
  }

  void updateHaiku(HaikuCreateModel oldHaiku, HaikuCreateModel newHaiku) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel);
    final index = stateHaikus.indexOf(oldHaiku);
    if (index != -1) {
      stateHaikus[index] = newHaiku;
      saveList(stateHaikus);
      _saveHaikus(stateHaikus);
    }
  }

  Future<void> _saveHaikus(List<HaikuCreateModel> haikus) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(haikus.map((haiku) => haiku.toMap()).toList());
    await prefs.setString('haikus', jsonString);
  }

  Future<void> _loadHaikus() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('haikus');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final haikus =
          jsonList.map((json) => HaikuCreateModel.fromMap(json)).toList();
      emit(state.copyWith(haikuCreateModel: haikus));
    }
  }

  void saveList(List<HaikuCreateModel> list) {
    emit(HaikuState(
      haikuCreateModel: list,
      image: null,
      selectedImageIndex: null,
    ));
  }

  void clear() {
    emit(HaikuState(
      haikuCreateModel: List<HaikuCreateModel>.from(state.haikuCreateModel),
      image: null,
      selectedImageIndex: null,
    ));
  }
}
