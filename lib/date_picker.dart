import 'package:flutter/material.dart';

import 'package:flutter_date_picker/enums.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daysOfWeek.values
              .map<Widget>((daysOfWeek day) => Text(day.abbreviate))
              .toList(),
        ),
        generateDays(daysOfWeek.wednesday, 30),
      ],
    );
  }
}

Widget generateDays(daysOfWeek startDay, int totalDays) {
  List<int> days = List.generate(startDay.index + totalDays, (index) => index);

  return GridView(
    shrinkWrap: true,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
    children: days.map<Widget>(
      (int day) {
        int currentDay = day - startDay.index;

        return currentDay < 0
            ? const SizedBox.shrink()
            : Center(child: Text('${currentDay + 1}'));
      },
    ).toList(),
  );
}
