import 'package:flutter/material.dart';

import 'package:flutter_date_picker/enums.dart';
import 'package:flutter_date_picker/extensions.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          buildMonthSelector(),
          const SizedBox(height: 16),
          buildDaysOfWeek(context),
          const SizedBox(height: 4),
          buildDays(context, daysOfWeek.wednesday, 30),
        ],
      );

  Widget buildMonthSelector() => Container(
        height: 32,
        width: 128,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<monthOfYear>(
          isExpanded: true,
          underline: const SizedBox.shrink(),
          value: monthOfYear.january,
          items: monthOfYear.values
              .map(
                (monthOfYear month) => DropdownMenuItem<monthOfYear>(
                  value: month,
                  child: Text(month.capitalize),
                ),
              )
              .toList(),
          onChanged: (monthOfYear? month) {},
        ),
      );
}

Widget buildDaysOfWeek(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: daysOfWeek.values
            .map<Widget>((daysOfWeek day) => buildDayOfWeek(context, day))
            .toList(),
      ),
    );

Widget buildDayOfWeek(BuildContext context, daysOfWeek dayOWeek) => Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      width: 50,
      child: Center(
        child: Text(
          dayOWeek.abbreviate,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget buildDays(BuildContext context, daysOfWeek startDay, int totalDays) {
  const int daysOfWeek = 7;
  final List<int> days =
      List<int>.generate(startDay.index + totalDays, (int index) => index);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 3),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: daysOfWeek,
      ),
      children: days.map<Widget>(
        (int day) {
          final int currentDay = day - startDay.index;

          return currentDay.isNegative
              ? const SizedBox.shrink()
              : Center(child: buildDayWidget(context, currentDay + 1));
        },
      ).toList(),
    ),
  );
}

Widget buildDayWidget(BuildContext context, int day) => Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.red,
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 8,
                left: 10,
                child: Text(
                  '$day',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 32,
                left: 32,
                child: Text(
                  '$day',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
