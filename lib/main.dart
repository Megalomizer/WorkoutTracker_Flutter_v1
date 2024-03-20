import 'package:workouttracker/MVVM/Views/allschedules.dart';
import 'package:workouttracker/MVVM/Views/createschedule.dart';
import 'package:workouttracker/MVVM/Views/scheduledetails.dart';
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/abstracts/databaseconfig.dart';

import 'package:workouttracker/MVVM/Widgets/maindrawer.dart';
import 'package:workouttracker/MVVM/Widgets/mainbody.dart';

// Provides acces to the db throughout the app
late ObjectBox box;

// A box for each object to interact with the db
//late final Box<Trainee> traineeBox;
// late final schedulesBox;
// late final elementBox;
// late final historyBox;

// Entry point into the application -> The very first beginning
Future<void> main() async {
  // Avoid errors caused by flutter upgrade & so objectbox can get the app directory to store the db in
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the DB
  box = await ObjectBox.create();

  // The boxes with data -> For each class one
  box.traineeBox = box.store.box<Trainee>();
  box.schedulesBox = box.store.box<TrainingsSchedule>();
  box.elementBox = box.store.box<TrainingsElement>();
  box.historyBox = box.store.box<HistorySchedule>();

  // Run the main app widget
  runApp(MaterialApp(
    title: 'Workout Tracker',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 90, 10, 175)),
      useMaterial3: true,
    ),
    home: MyAppHome(),
    routes: <String, WidgetBuilder>{
      '/schedules': (BuildContext context) => const AllSchedules(),
      '/schedules/details': (BuildContext context) => const ScheduleDetails(),
      '/schedules/create': (BuildContext context) => const CreateSchedule(),
    }
  ));
} 

// Main app home
class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Homescreen",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const MainBody(),
      drawer: const MainDrawer(),
    );
  }
}