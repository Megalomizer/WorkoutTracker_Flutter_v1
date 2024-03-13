import 'package:workouttracker/abstracts/fileimports.dart';

import 'package:flutter/widgets.dart';
import 'package:workouttracker/MVVM/Views/firstscreen.dart';

MaterialApp myAppMain(BuildContext context) {
  return MaterialApp(
    title: "Homepage",
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 90, 10, 175)),
      useMaterial3: true,
    ),
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Homescreen",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstScreen())
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 90, 10, 175),
                    shape: const RoundedRectangleBorder(),
                    elevation: 10,
                  ),
                  child: const Text(
                    "Show all schedules",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 90, 10, 175)
              ),
              child: Text(
                "Drawer!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: const Text(
                "Listtile 1",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  );
}