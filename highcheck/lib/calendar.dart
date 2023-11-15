import 'package:flutter/material.dart';
import 'package:help/utils.dart';
import 'package:help/widgets/palette.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          eventLoader: _getEventsForDay,
          onDaySelected: _onDaySelected,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          headerStyle: HeaderStyle(
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: lavenderPalette['onSecondary'],
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: lavenderPalette['onSecondary'],
              ),
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                  color: lavenderPalette['onSecondary'], fontSize: 24)),
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: lavenderPalette['onSecondary']),
              weekendStyle: TextStyle(color: lavenderPalette['onSecondary'])),
          calendarStyle: CalendarStyle(
            markerDecoration: BoxDecoration(
                shape: BoxShape.circle, color: lavenderPalette['primary']),
            todayTextStyle:
                TextStyle(color: lavenderPalette['onSurfaceVariant']),
            todayDecoration: BoxDecoration(
              color: lavenderPalette['primaryInverse'],
              shape: BoxShape.circle,
            ),
            selectedTextStyle:
                TextStyle(color: lavenderPalette['onSurfaceVariant']),
            selectedDecoration: BoxDecoration(
                color: lavenderPalette['primaryInverse'],
                shape: BoxShape.circle),
            weekNumberTextStyle: TextStyle(color: lavenderPalette['onPrimary']),
            weekendTextStyle: TextStyle(color: lavenderPalette['onPrimary']),
            outsideTextStyle: TextStyle(color: lavenderPalette['primary']),
            defaultTextStyle: TextStyle(color: lavenderPalette['onPrimary']),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: lavenderPalette['primary']!),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${value[index]}'),
                      title: Text(
                        '${value[index]}',
                        style: TextStyle(color: lavenderPalette['onPrimary']),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
