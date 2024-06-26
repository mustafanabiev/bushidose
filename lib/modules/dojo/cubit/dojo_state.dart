part of 'dojo_cubit.dart';

class DojoState {
  final Map<String, List<DojoSelectModel>> dojoSelectMap;
  final String selectedDate;

  DojoState({
    required this.dojoSelectMap,
    required this.selectedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'dojoSelectMap': dojoSelectMap.map((key, value) => MapEntry(
            key,
            value.map((item) => item.toJson()).toList(),
          )),
      'selectedDate': selectedDate,
    };
  }

  factory DojoState.fromJson(Map<String, dynamic> json) {
    return DojoState(
      dojoSelectMap: (json['dojoSelectMap'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List)
              .map((item) => DojoSelectModel.fromJson(item))
              .toList(),
        ),
      ),
      selectedDate: json['selectedDate'],
    );
  }

  DojoState copyWith({
    Map<String, List<DojoSelectModel>>? dojoSelectMap,
    String? selectedDate,
  }) {
    return DojoState(
      dojoSelectMap: dojoSelectMap ?? this.dojoSelectMap,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
