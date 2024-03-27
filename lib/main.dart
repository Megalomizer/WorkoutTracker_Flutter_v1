import 'package:workouttracker/abstracts/pageimports.dart'; // All pages imported
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/abstracts/databaseconfig.dart';

import 'package:workouttracker/MVVM/Widgets/maindrawer.dart';
import 'package:workouttracker/MVVM/Widgets/mainbody.dart';

// Provides acces to the db throughout the app
late ObjectBox box;

// General / Active user
Trainee? activeUser;

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

  // Configure the general user / active user -> No logging in
  Trainee activeUser =  Trainee(id: 1);
  putTrainee(activeUser);
  Trainee? user = getTrainee(1);
  if(user != null) activeUser = user;

  // Run the main app widget
  runApp(MaterialApp(
    title: 'Workout Tracker',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 90, 10, 175)),
      useMaterial3: true,
    ),
    home: MyAppHome(),
    routes: <String, WidgetBuilder>{
      '/schedules': (BuildContext context) => const AllSchedules(),
      '/schedules/details': (BuildContext context) => const ScheduleDetails(),
      '/schedules/create': (BuildContext context) => const CreateSchedule(),
      '/elements': (BuildContext context) => const AllElements(),
      '/elements/create': (BuildContext context) => const CreateElement(),
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
        title: const AppBarTitleText(text: 'Homescreen'),
      ),
      body: const MainBody(),
      drawer: const MainDrawer(),
    );
  }
}