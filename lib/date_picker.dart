import 'package:flutter/material.dart';

import 'package:flutter_date_picker/enums.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek.values
                .map<Widget>((daysOfWeek day) => Text(day.abbreviate))
                .toList(),
          ),
          generateDays(daysOfWeek.wednesday, 30),
        ],
      );
}

Widget generateDays(daysOfWeek startDay, int totalDays) {
  const int daysOfWeek = 7;
  final List<int> days =
      List<int>.generate(startDay.index + totalDays, (int index) => index);

  return GridView(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: daysOfWeek,
    ),
    children: days.map<Widget>(
      (int day) {
        final int currentDay = day - startDay.index;

        return currentDay.isNegative
            ? const SizedBox.shrink()
            : Center(child: Text('${currentDay + 1}'));
      },
    ).toList(),
  );
}
