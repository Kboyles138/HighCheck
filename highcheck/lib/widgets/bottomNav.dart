import 'package:flutter/material.dart';
import 'package:help/calendar.dart';
import 'package:help/home.dart';
import 'package:help/settings.dart';
import 'package:help/widgets/palette.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({required this.selectedIndex, super.key});

  final int selectedIndex;

  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
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
        backgroundColor: palette['appBar'],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon:  Icon(
                Icons.add_circle_outline,
                size: 38,
                
                color: palette['text'],
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
          selectedItemColor: palette['highlight'],
          showUnselectedLabels: true,
          backgroundColor: palette['appBar'],
          unselectedItemColor: palette['text'],
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
