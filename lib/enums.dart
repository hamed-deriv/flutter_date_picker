enum daysOfWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

extension DaysOfWeek on daysOfWeek {
  String get abbreviate => '${name[0].toUpperCase()}${name[1]}';

  String get capitalize => '${name[0].toUpperCase()}${name.substring(1)}';
}
