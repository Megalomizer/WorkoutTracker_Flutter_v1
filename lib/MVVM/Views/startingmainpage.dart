import 'package:flutter/material.dart'; // import flutter package material -> Used to create UI
import 'package:flutter/widgets.dart'; // Required to avoid errors caused by flutter upgrade
import 'package:path/path.dart';

import './firstscreen.dart';
import './secondscreen.dart';
import './thirdscreen.dart';
import './firstscreendataentry.dart';

import 'package:workouttracker/MVVM/Models/dog.dart'; 

MaterialApp getStartingScreen(BuildContext context){
  return MaterialApp(
    title: "TabbedPages!", // Title of the application
    // Theme of the widget
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    // The inner UI of the application -> We set another widget -> A new class
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.email),
              ),
              Tab(
                icon: Icon(Icons.dangerous_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FirstScreen(),
            ThirdScreen(),
            DogpageWidget(),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  "Heading",
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: const Text(
                  "AllDogs",
                ),
                onTap: () {},
              ),
              const ListTile(
                title: Text(
                  "Tab 2"
                ),
                onTap: onTapProgram,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void onTapProgram(){
  
}

