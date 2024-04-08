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
  int duration = 0;
  int kcal = 0;
  bool locationSpecific = false;
  
  final scheduleItems = ToMany<TrainingsElement>(); // N:M
  final schedule = ToOne<TrainingsSchedule>(); // 1:1
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////       General CRUD Implementation Sequence       ///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\

// Put a new object in the db box
void putHistory(HistorySchedule history) {
  box.historyBox.put(history);
}

// Get an object by id from the db box
HistorySchedule? getHistory(int id) {
  HistorySchedule? history = box.historyBox.get(id);
  return history;
}

// Get multiple objects by id from the db box
List<HistorySchedule?> getMultipleHistories(List<int> ids) {
  List<HistorySchedule?> histories = box.historyBox.getMany(ids);
  return histories;
}

// Get all objects from the db box
List<HistorySchedule?> getAllHistories() {
  List<HistorySchedule?> histories = box.historyBox.getAll();
  return histories;
}

// Remove the object from the db box using id
bool removeHistory(int id) {
  final wasRemoved = box.historyBox.remove(id);
  return wasRemoved;
}

// Remove multiple objects from the db box using id
bool removeMultipleHistories(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.historyBox.removeMany(ids);
  if(totalRemoved == totalToRemove) {
    // When everything is removed
    return true;
  }
  return false; // Else
}

// Remove all objects from the db box
bool removeAllHistories({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.historyBox.count();
    final totalRemoved = box.historyBox.removeAll();
    if(totalRemoved == totalToRemove) {
      return true;
    }
  }

  return false;
}