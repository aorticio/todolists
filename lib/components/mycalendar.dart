import "package:flutter/material.dart";
import "package:table_calendar/table_calendar.dart";

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableCalendar(
        focusedDay: DateTime.now(), 
        firstDay: DateTime.utc(2010, 10, 16), 
        lastDay: DateTime.utc(2030, 3, 14),
        selectedDayPredicate: (day){
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call'setState()' when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        ),
    );
  }
}
