class DojoDateModel {
  const DojoDateModel({
    required this.dayName,
    required this.dayNumber,
    required this.month,
    required this.icon,
    required this.today,
  });

  final String dayName;
  final String dayNumber;
  final String month;
  final String icon;
  final bool today;
}

List<DojoDateModel> dojoDays = [
  const DojoDateModel(
    dayName: 'Thu',
    dayNumber: '22',
    month: 'Apr',
    icon: 'assets/icons/moon.svg',
    today: false,
  ),
  const DojoDateModel(
    dayName: 'Thu',
    dayNumber: '23',
    month: 'Apr',
    icon: 'assets/icons/moon.svg',
    today: true,
  ),
  const DojoDateModel(
    dayName: 'Thu',
    dayNumber: '24',
    month: 'Apr',
    icon: 'assets/icons/moon.svg',
    today: false,
  ),
];
