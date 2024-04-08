import 'package:workouttracker/abstracts/pageimports.dart'; // All pages imported
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/abstracts/databaseconfig.dart'; // Database

/// Provides acces to the db throughout the app
late ObjectBox box;

/// General / Active user
Trainee? activeUser;

/// Entry point into the application -> The very first beginning
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
      colorScheme: ColorScheme.fromSeed(seedColor: color_primary),
      useMaterial3: true,
      fontFamily: 'WorkSans',
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

/// Main app home screen
class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarHeaderTextStyle(text: 'Homescreen'),
      ),
      body: const MainBody(),
      drawer: const DrawerPreset(),
    );
  }
}

/// Main app home screen body
class MainBody extends StatelessWidget {
  //final BuildContext context;
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        top: 20,
        right: 30,
        bottom: 10,
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/schedules'),
              style: primairyButtonStyle,
              child: const PrimairyButtonTextStyle(text: 'Show all schedules'),
            ),
          ),
        ],
      ),
    );
  }
}