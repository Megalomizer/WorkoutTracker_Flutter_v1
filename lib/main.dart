import 'package:flutter/material.dart'; // import flutter package material -> Used to create UI
import 'package:flutter/widgets.dart'; // Required to avoid errors caused by flutter upgrade
import 'package:path/path.dart';
import 'package:workouttracker/Abstracts/databaseconfig.dart';
import 'dart:async';

import 'MVVM/Views/startingmainpage.dart';
import 'MVVM/Models/trainee.dart';
import 'MVVM/Models/trainingsschedule.dart';
import 'MVVM/Models/trainingselement.dart';
import 'MVVM/Models/traininghistoryschedules.dart';


// Provides acces to the db throughout the app
late ObjectBox box;

// A box for each object to interact with the db
//late final Box<Trainee> traineeBox;
late final schedulesBox;
late final elementBox;
late final historyBox;

// Entry point into the application -> The very first beginning
Future<void> main() async {
  // Avoid errors caused by flutter upgrade & so objectbox can get the app directory to store the db in
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the DB
  box = await ObjectBox.create();

  // The boxes with data -> For each class one
  box.traineeBox = box.store.box<Trainee>();
  schedulesBox = box.store.box<TrainingsSchedule>();
  elementBox = box.store.box<TrainingsElement>();
  historyBox = box.store.box<HistorySchedule>();

  // Run the main app widget
  runApp(const MyApp());
} 

//FIXME: Please fix the starting screen -> Its not good
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