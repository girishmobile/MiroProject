import 'dart:ui';

import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppGlassCalendar extends StatelessWidget {
  const AppGlassCalendar({
    super.key,
    required this.onDateSelected,
    required this.firstDay,
  });
  final Function(DateTime) onDateSelected;
  final DateTime firstDay;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDay;
    DateTime focusedDay = firstDay;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 430,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: appGradient,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customHeader(),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: firstDay,
                lastDay: DateTime(2100),
                selectedDayPredicate: (day) => isSameDay(focusedDay, day),
                onDaySelected: (selected, focused) {
                  selectedDay = selected;
                  focusedDay = focused;
                  onDateSelected(selected);
                },
                headerVisible: false, //hide inbuilt header
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),

                  selectedDecoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontRoboto,
                  ),
                  leftChevronIcon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white70),
                  weekendStyle: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Jan 2020",
                  style: TextStyle(
                    fontFamily: fontRoboto,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
