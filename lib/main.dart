import 'package:flutter/material.dart'; // import flutter package material -> Used to create UI
import 'package:flutter/widgets.dart'; // Required to avoid errors caused by flutter upgrade
import 'package:sqflite/sqflite.dart'; // SQlite package
import 'package:path/path.dart';

import 'dart:async';

import 'MVVM/Views/startingmainpage.dart';

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
  String createDogsTable = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, age INTEGER)';

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

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // this widget is the root of your application
  @override
  Widget build(BuildContext context){
    return getStartingScreen(context);
  }
}

abstract class ListItem {
  // the title line to show in a list item
  Widget buildTitle(BuildContext context);

  // the context lines, if any, to show in a list item
  Widget buildContext(BuildContext context);
}