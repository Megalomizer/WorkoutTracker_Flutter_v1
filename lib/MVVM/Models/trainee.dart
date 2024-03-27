import 'package:objectbox/objectbox.dart';
import 'package:workouttracker/MVVM/temp/firstscreen.dart';
import 'package:workouttracker/main.dart';

import './trainingsschedule.dart';

@Entity()
class Trainee {
  // properties
  @Id()
  int id = 0;
  @Index(type: IndexType.value)
  String? firstName;
  @Index(type: IndexType.value)
  String? lastName;
  @Backlink('trainee')
  final schedules = ToMany<TrainingsSchedule>(); // 1:N

  // constructor
  Trainee({id, firstName, lastName, schedules});
  
  // Makes it easier to view/print information about an object
  @override
  String toString() {
    return 'Trainee{id: $id, firstName: $firstName, lastName: $lastName, total schedules: ${schedules.length}}';
  }
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||//
//|||||||||||||||||||||||||||||||||||||||||||||//      General CRUD Implementation Sequence          //|||||||||||||||||||||||||||||||||||||||||||||// 
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||//

/// Put a new object in the db box
void putTrainee(Trainee trainee) {
  box.traineeBox.put(trainee);
}

/// Get an object by id from the db box
Trainee? getTrainee(int id) {
  Trainee? trainee = box.traineeBox.get(id);
  return trainee;
}

/// Get multiple objects by id from the db box
List<Trainee?> getMultipleTrainees(List<int> ids) {
  List<Trainee?> trainees = box.traineeBox.getMany(ids);
  return trainees;
}

/// Get all objects from the db box
List<Trainee?> getAllTrainees() {
  List<Trainee?> trainees = box.traineeBox.getAll();
  return trainees;
}

/// Remove the object from the db box using id
bool removeTrainee(int id) {
  final wasRemoved = box.traineeBox.remove(id);
  return wasRemoved;
}

/// Remove multiple objects from the db box using id
bool removeMultipleTrainees(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.traineeBox.removeMany(ids);
  if(totalRemoved == totalToRemove) {
    // When everything is removed
    return true;
  }
  return false; // Else
}

/// Remove all objects from the db box
bool removeAllTrainees({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.traineeBox.count();
    final totalRemoved = box.traineeBox.removeAll();
    if(totalRemoved == totalToRemove) {
      return true;
    }
  }

  return false;
}