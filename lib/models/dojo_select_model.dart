class DojoSelectModel {
  final String icon;
  final String name;
  final bool select;

  const DojoSelectModel({
    required this.icon,
    required this.name,
    required this.select,
  });

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'name': name,
      'select': select,
    };
  }

  factory DojoSelectModel.fromJson(Map<String, dynamic> json) {
    return DojoSelectModel(
      icon: json['icon'],
      name: json['name'],
      select: json['select'],
    );
  }
}
