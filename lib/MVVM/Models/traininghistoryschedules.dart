import 'package:objectbox/objectbox.dart';
import 'package:workouttracker/main.dart';

import './trainingselement.dart';
import './trainingsschedule.dart';

@Entity()
class HistorySchedule {
  // properties
  @Id()
  int id = 0;

  @Index(type: IndexType.value)
  String? name;

  DateTime date = DateTime.now();
  Duration duration = Duration.zero;
  int kcal = 0;
  bool locationSpecific = false;
  
  final scheduleItems = ToMany<TrainingsElement>(); // N:M
  final schedule = ToOne<TrainingsSchedule>(); // 1:1

  // // Makes it easier to view/print information about an object
  // @override
  // String toString() {
  //   return 'TrainingsSchedule{id: $id, name: $name, duration: ${duration.inMinutes}, kcal: $kcal, locationSpecific: $locationSpecific, schedule: $schedule}';
  // }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////       General CRUD Implementation Sequence       ///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\

// Put a new object in the db box
void putObject(HistorySchedule history) {
  box.historyBox.put(history);
}

// Get an object by id from the db box
HistorySchedule? getObject(int id) {
  HistorySchedule? history = box.historyBox.get(id);
  return history;
}

// Get multiple objects by id from the db box
List<HistorySchedule?> getMultipleObjects(List<int> ids) {
  List<HistorySchedule?> histories = box.historyBox.getMany(ids);
  return histories;
}

// Get all objects from the db box
List<HistorySchedule?> getAllObjects() {
  List<HistorySchedule?> histories = box.historyBox.getAll();
  return histories;
}

// Remove the object from the db box using id
bool removeObject(int id) {
  final wasRemoved = box.historyBox.remove(id);
  return wasRemoved;
}

// Remove multiple objects from the db box using id
bool removeMultipleObjects(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.historyBox.removeMany(ids);
  if(totalRemoved == totalToRemove) {
    // When everything is removed
    return true;
  }
  return false; // Else
}

// Remove all objects from the db box
bool removeAllObjects({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.historyBox.count();
    final totalRemoved = box.historyBox.removeAll();
    if(totalRemoved == totalToRemove) {
      return true;
    }
  }

  return false;
}