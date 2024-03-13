import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

import 'package:workouttracker/Abstracts/databaseconfig.dart';
import 'package:workouttracker/MVVM/Views/myappmain.dart';

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

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // this widget is the root of your application
  @override
  Widget build(BuildContext context){
    return myAppMain(context);
  }
}

abstract class ListItem {
  // the title line to show in a list item
  Widget buildTitle(BuildContext context);

  // the context lines, if any, to show in a list item
  Widget buildContext(BuildContext context);
}