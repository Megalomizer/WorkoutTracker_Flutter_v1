import 'package:flutter/material.dart'; // import flutter package material -> Used to create UI
import 'package:flutter/widgets.dart'; // Required to avoid errors caused by flutter upgrade

import './firstscreen.dart';
import './secondscreen.dart';
import './thirdscreen.dart';
import './firstscreendataentry.dart';

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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.view_list),
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
            SecondScreen(),
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
              const ListTile(
                title: Text(
                  "Tab 1",
                ),
                onTap: onTapProgram,
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