import 'package:workouttracker/MVVM/temp/thirdscreen.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

import 'package:flutter/widgets.dart';
import 'package:workouttracker/MVVM/temp/firstscreen.dart';

// Main app drawer
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 90, 10, 175)
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                "Home",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            title: const DrawerListItem(text: 'All Schedules'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/schedules',
              )
            },
          ),
          ListTile(
            title: const DrawerListItem(text: 'All Elements'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/elements',
              );
            },
          )
        ],
      ),
    );
  }
}