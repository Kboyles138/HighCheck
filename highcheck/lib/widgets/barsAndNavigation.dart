// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:help/calendar.dart';
import 'package:help/home.dart';
import 'package:help/settings.dart';
import 'package:help/widgets/palette.dart';

class BarsAndNavigation extends StatefulWidget {
  const BarsAndNavigation({required this.selectedIndex, super.key});

  final int selectedIndex;

  @override
  _BarsAndNavigation createState() => _BarsAndNavigation();
}

class _BarsAndNavigation extends State<BarsAndNavigation> {
  int _selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  Future<void> _onItemTapped(final int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lavenderPalette['onSurface'],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon:  Icon(
                Icons.add_circle_outline,
                size: 38,
                color: lavenderPalette['primary'],
              ),
              tooltip: 'Add new task',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: lavenderPalette['primary'],
          showUnselectedLabels: true,
          backgroundColor: lavenderPalette['onSurface'],
          unselectedItemColor: lavenderPalette['primary'],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 38), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month, size: 38), label: 'Calendar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 38), label: 'Settings')
          ]),
      body: [
        const MyHomePage(),
        const Calendar(),
        const Settings(),
      ][_selectedIndex],
    );
  }
}
