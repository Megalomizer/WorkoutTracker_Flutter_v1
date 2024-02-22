import 'package:flutter/material.dart'; // import flutter package material -> Used to create UI
import 'package:flutter/widgets.dart'; // Required to avoid errors caused by flutter upgrade
import 'package:sqflite/sqflite.dart'; // SQlite package
import 'package:path/path.dart';
import 'dart:async';

import 'MVVM/Views/firstscreen.dart';
import 'MVVM/Views/secondscreen.dart';
import 'MVVM/Views/thirdscreen.dart';

// Entry point into the application -> The very first beginning
void main() {
  runApp(const MyApp());

  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();

  // Create and open a SQLite database and store the reference
  final database = getDatabase();

  Future<Database> GetDatabaseInstance() async {
    return database;
  }
} 

// Open the SQLite database and store the reference.
Future<Database> getDatabase() async {
  // Set SQLite statements with column names, types and properties
  String createDogsTable = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';

  // Create and return connection
  return openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'), // Set the path to the database.
    onCreate: (db, version){
      // Run the CREATE TABLE statement on the database --> Uses SQLite statements
      return db.execute(
        createDogsTable,
      );
    },
    version: 1,
  );
}

// TODO: Set a way to add a dog and view all dogs _> maybe also select a dog and edit & delete

// FIXME: relocate widget itself -> only redirect from main actual page needs its own file

String title = "WHAAAAAAAAAA";
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // this widget is the root of your application
  @override
  Widget build(BuildContext context){
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
                  icon: Icon(Icons.view_list),
                ),
                Tab(
                  icon: Icon(Icons.email),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
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
                  title: Text(
                    title,
                  ),
                  onTap: item1tapped,
                ),
                const ListTile(
                  title: Text(
                    "Revert"
                  ),
                  onTap: item2tapped,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void item1tapped(){
  title = "Tapped :)";
}

void item2tapped(){
  title = "WHAAAAAAAAAA";
}