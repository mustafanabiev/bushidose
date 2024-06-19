import 'package:bushidose/models/haiku_create_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'haiku_state.dart';

class HaikuCubit extends Cubit<HaikuState> {
  HaikuCubit() : super(HaikuState(haikuCreateModel: []));

  void saveImage(String image) {
    emit(state.copyWith(image: image));
  }

  void saveImageCount(int? count) {
    emit(state.copyWith(selectedImageIndex: count));
  }

  void createNew(HaikuCreateModel haikuCreateModel) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel)
      ..add(haikuCreateModel);
    emit(state.copyWith(haikuCreateModel: stateHaikus));
  }

  void deleteHaiku(HaikuCreateModel haikuCreateModel) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel)
      ..remove(haikuCreateModel);
    emit(state.copyWith(haikuCreateModel: stateHaikus));
  }

  void updateHaiku(HaikuCreateModel oldHaiku, HaikuCreateModel newHaiku) {
    final stateHaikus = List<HaikuCreateModel>.from(state.haikuCreateModel);
    final index = stateHaikus.indexOf(oldHaiku);
    if (index != -1) {
      stateHaikus[index] = newHaiku;
      emit(state.copyWith(haikuCreateModel: stateHaikus));
    }
  }
}
