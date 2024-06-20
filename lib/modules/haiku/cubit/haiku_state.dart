part of 'haiku_cubit.dart';

class HaikuState {
  HaikuState({
    required this.haikuCreateModel,
    this.selectedImageIndex,
    this.image,
  });

  final List<HaikuCreateModel> haikuCreateModel;
  final int? selectedImageIndex;
  final Uint8List? image;

  HaikuState copyWith({
    List<HaikuCreateModel>? haikuCreateModel,
    int? selectedImageIndex,
    Uint8List? image,
  }) {
    return HaikuState(
      haikuCreateModel: haikuCreateModel ?? this.haikuCreateModel,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
      image: image ?? this.image,
    );
  }
}
