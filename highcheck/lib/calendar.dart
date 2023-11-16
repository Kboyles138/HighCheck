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
        // Table calendar package
        // https://pub.dev/packages/table_calendar
        TableCalendar<Event>(
          // the range of the available months the user can scroll to 
          // set up in utils.dart for 10 months before todays date and 10 months after todays date
          firstDay: kFirstDay,
          lastDay: kLastDay,
          // focused day is set to today
          focusedDay: _focusedDay,
          // calendar sent to month mode
          calendarFormat: _calendarFormat,
          // check to see if today and selected day is the same day
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          // loads the events of the given day
          eventLoader: _getEventsForDay,
          onDaySelected: _onDaySelected,
          // handles the calendar if the format changes from one calendar format to another
          // will be used for going into a day and seeing a more detailed task view possible
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          // remembers the focused day when the month changes
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },

          // all styling for the calendar
          // header style (the month year and the chevrons)
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
          // style for the days of the week at the top of the calendar
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: lavenderPalette['onSecondary']),
              weekendStyle: TextStyle(color: lavenderPalette['onSecondary'])),
          // styling for the actual calendar elements
          calendarStyle: CalendarStyle(
            // event marker styling
            markerDecoration: BoxDecoration(
                shape: BoxShape.circle, color: lavenderPalette['primary']),
            // current day styling and decoration
            todayTextStyle:
                TextStyle(color: lavenderPalette['onSurfaceVariant']),
            todayDecoration: BoxDecoration(
              color: lavenderPalette['primaryInverse'],
              shape: BoxShape.circle,
            ),
            // selected day styling and decoration
            selectedTextStyle:
                TextStyle(color: lavenderPalette['onSurfaceVariant']),
            selectedDecoration: BoxDecoration(
                color: lavenderPalette['primaryInverse'],
                shape: BoxShape.circle),
            // Sat and Sun numbers inside the calendar styling
            weekendTextStyle: TextStyle(color: lavenderPalette['onPrimary']),
            // dates outside of the active month styling
            outsideTextStyle: TextStyle(color: lavenderPalette['primary']),
            // default styling (affects M - F numbers)
            defaultTextStyle: TextStyle(color: lavenderPalette['onPrimary']),
          ),
        ),
        // spacer, replace with padding later if necessary
        const SizedBox(height: 8.0),
        // events builder
        // displays the selected days events if there are any
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
                      // add check list here or status indicator
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
