import 'package:flutter/material.dart';
import 'package:help/widgets/palette.dart';

class DailyTasks {
  DailyTasks(this.id, this.title, this.details, this.time);
  final int id;
  final String title;
  final String details;
  final DateTime time;

  static List<DailyTasks> dailyTasks() => <DailyTasks>[
        DailyTasks(
          0,
          'Task 1',
          'test',
          DateTime.now(),
        ),
        DailyTasks(
          1,
          'Task 1',
          'test',
          DateTime.now(),
        ),
      ];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<dynamic> _dailyTasks = DailyTasks.dailyTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FittedBox(
               alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.purple,
               
                child: const Text(
                  'Daily Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dailyTasks.length,
              itemBuilder: (final BuildContext context, final int index) =>
                  Text(_dailyTasks[index].title),
            ),
          ],
        ),
      ),
    );
  }
}
