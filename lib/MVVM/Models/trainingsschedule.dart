import 'package:objectbox/objectbox.dart';
import 'package:workouttracker/main.dart';

import './trainee.dart';
import './trainingselement.dart';

@Entity()
class TrainingsSchedule {
  // properties
  @Id()
  int id = 0;

  @Index(type: IndexType.value)
  String? name;

  Duration duration = Duration.zero;
  int kcal = 0;
  bool locationSpecific = false;
  
  @Backlink('schedule')
  final scheduleItems = ToMany<TrainingsElement>(); // 1:N
  final trainee = ToOne<Trainee>(); // 1:N
  
  // // Makes it easier to view/print information about an object
  // @override
  // String toString() {
  //   return 'TrainingsSchedule{id: $id, name: $name, trainee: $trainee, duration: ${duration.inMinutes}, kcal: $kcal, locationSpecific: $locationSpecific}';
  // }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////       General CRUD Implementation Sequence       ///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Put a new object in the db box
void putSchedule(TrainingsSchedule schedule) {
  box.schedulesBox.put(schedule);
}

// Get an object by id from the db box
TrainingsSchedule? getSchedule(int id) {
  TrainingsSchedule? schedule = box.schedulesBox.get(id);
  return schedule;
}

// Get multiple objects by id from the db box
List<TrainingsSchedule?> getMultipleSchedules(List<int> ids) {
  List<TrainingsSchedule?> schedules = box.schedulesBox.getMany(ids);
  return schedules;
}

// Get all objects from the db box
List<TrainingsSchedule?> getAllSchedules() {
  List<TrainingsSchedule?> schedules = box.schedulesBox.getAll();
  return schedules;
}

// Remove the object from the db box using id
bool removeSchedule(int id) {
  final wasRemoved = box.schedulesBox.remove(id);
  return wasRemoved;
}

// Remove multiple objects from the db box using id
bool removeMultipleSchedules(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.schedulesBox.removeMany(ids);
  if(totalRemoved == totalToRemove) {
    // When everything is removed
    return true;
  }
  return false; // Else
}

// Remove all objects from the db box
bool removeAllSchedules({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.schedulesBox.count();
    final totalRemoved = box.schedulesBox.removeAll();
    if(totalRemoved == totalToRemove) {
      return true;
    }
  }

  return false;
}