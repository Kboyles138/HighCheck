import 'package:flutter/material.dart';
import 'package:help/widgets/palette.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<dynamic> _dailyTasks = DailyTasks.dailyTasks();
  bool value1 = true;
  bool value2 = false; 
  bool value3 = false;
  bool value4 = false; 
  bool value5 = false; 
  bool value6 = false; 
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: lavenderPalette['onPrimary']),
            child: const Text(
              'Daily Tasks',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: lavenderPalette['onPrimary'],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListView(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
             children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 1'),
                  value: value1,
                  onChanged: (bool? value) {
                    setState(() {
                      value1 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 2'),
                  value: value2,
                  onChanged: (bool? value) {
                    setState(() {
                      value2 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 3'),
                  value: value3,
                  onChanged: (bool? value) {
                    setState(() {
                      value3 = value!;
                    });
                  },
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: lavenderPalette['onPrimary']),
            child: const Text(
              'Weekly Tasks',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: lavenderPalette['onPrimary'],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListView(shrinkWrap: true, 
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 4'),
                  value: value4,
                  onChanged: (bool? value) {
                    setState(() {
                      value4 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 5'),
                  value: value2,
                  onChanged: (bool? value) {
                    setState(() {
                      value5 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 6'),
                  value: value3,
                  onChanged: (bool? value) {
                    setState(() {
                      value6 = value!;
                    });
                  },
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: lavenderPalette['onPrimary']),
            child: const Text(
              'Monthly Tasks',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: lavenderPalette['onPrimary'],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListView(shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
             children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 7'),
                  value: value7,
                  onChanged: (bool? value) {
                    setState(() {
                      value7 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 8'),
                  value: value2,
                  onChanged: (bool? value) {
                    setState(() {
                      value8 = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lavenderPalette['primary']!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: const Text('Task 9'),
                  value: value3,
                  onChanged: (bool? value) {
                    setState(() {
                      value9 = value!;
                    });
                  },
                ),
              ),
            ]),
          ),
              ],
            ),
        ));
  }
}

/*
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
}*/