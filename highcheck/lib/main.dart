import 'package:flutter/material.dart';
import 'package:help/widgets/barsAndNavigation.dart';
import 'package:help/widgets/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HighCheck',
      debugShowCheckedModeBanner: false,   
      theme: ThemeData(
        scaffoldBackgroundColor: lavendarPalette['onSurfaceVariant'],
        useMaterial3: true,
      ),
      home: const BarsAndNavigation(selectedIndex: 0),
    );
  }
}

