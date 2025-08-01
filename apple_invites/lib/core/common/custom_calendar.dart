import 'dart:ui';

import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  final int startYear = 1900;
  final int endYear = 2100;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 460,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: appGradient,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<int>(
                    menuMaxHeight: 280,

                    value: focusedDay.year,
                    dropdownColor: Colors.black.withValues(alpha: 0.5),
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.white,
                    items: List.generate(endYear - startYear + 1, (index) {
                      final year = startYear + index;
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }),
                    onChanged: (year) {
                      if (year != null) {
                        setState(() {
                          focusedDay = DateTime(year, focusedDay.month, 1);
                        });
                      }
                    },
                  ),
                ],
              ),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime(startYear),
                lastDay: DateTime(endYear),
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    focusedDay = focused;
                  });
                },
                headerVisible: true,
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
