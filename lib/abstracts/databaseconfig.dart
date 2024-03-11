import 'package:path_provider/path_provider.dart';
import 'package:workouttracker/objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'package:path/path.dart';

import 'package:workouttracker/MVVM/Models/trainee.dart';
import 'package:workouttracker/MVVM/Models/traininghistoryschedules.dart';
import 'package:workouttracker/MVVM/Models/trainingselement.dart';
import 'package:workouttracker/MVVM/Models/trainingsschedule.dart';

import 'package:objectbox/objectbox.dart';
/// To Config objectbox after changing the objectmodels run:
/// flutter pub run build_runner build

class ObjectBox {
  // The store (database) of this app
  late final Store store;

  ObjectBox._create(this.store) {
    // Any additional setup code comes here. like build queries
  }

  // Create an instance of the store for the use in the entire app
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "workouttracker_store"));
    return ObjectBox._create(store);
  }

  // Create boxes for each object to interact with the db
  late final Box<Trainee> traineeBox;
  late final Box<TrainingsSchedule> schedulesBox;
  late final Box<TrainingsElement> elementBox;
  late final Box<HistorySchedule> historyBox;
} 