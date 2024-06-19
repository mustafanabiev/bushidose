class JournalModel {
  const JournalModel({
    required this.day,
    required this.week,
    required this.name,
  });

  final String day;
  final List<bool> week;
  final String name;
}

List<JournalModel> journalList = [
  const JournalModel(
    day: '365',
    name: 'Haiku',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '2',
    name: 'Meditation',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '1',
    name: 'katana',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '34',
    name: 'exercise',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '5',
    name: 'Hot bath',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '0',
    name: 'Green tea',
    week: [false, false, false, false, false, false, false],
  ),
  const JournalModel(
    day: '25',
    name: 'Posture',
    week: [true, true, false, false, false, false, false],
  ),
  const JournalModel(
    day: '10',
    name: 'Sleep',
    week: [true, true, false, false, false, false, false],
  ),
];
