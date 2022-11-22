import 'package:flutter_date_picker/enums.dart';

daysOfWeek getFirstDayOfWeek({
  required int year,
  required monthOfYear month,
}) {
  final DateTime selectedDate = DateTime(year, month.index + 1);

  return daysOfWeek.values[(selectedDate.weekday) % 7];
}

int getMonthDaysCount({
  required int year,
  required monthOfYear month,
}) {
  final DateTime selectedDate = DateTime(year, month.index + 2, 0);

  return selectedDate.day;
}
