import 'package:flutter/material.dart';
import 'package:help/widgets/palette.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController calendarController = CalendarController();

  final List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.month,
    CalendarView.week,
    CalendarView.day,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfCalendar(
        controller: calendarController,
        showDatePickerButton: true,
        allowedViews: _allowedViews,
        view: CalendarView.month,
        selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: palette['highlight']!)),
        todayHighlightColor: palette['appBar'],
        cellBorderColor: palette['text'],
        headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle(
                color: palette['text'],
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        monthViewSettings: MonthViewSettings(
            appointmentDisplayCount: 2,
            numberOfWeeksInView: 6,
            monthCellStyle:
                MonthCellStyle(textStyle: TextStyle(color: palette['text']))),
        weekNumberStyle:
            WeekNumberStyle(textStyle: TextStyle(color: palette['text'])),
      ),
    );
  }
}
