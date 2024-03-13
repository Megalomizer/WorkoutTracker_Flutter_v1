import 'package:objectbox/objectbox.dart';
import 'package:workouttracker/main.dart';

import './trainingsschedule.dart';

@Entity()
class TrainingsElement {
  // properties
  @Id()
  int id = 0;

  @Index(type: IndexType.value)
  String? name;

  String? description;
  int sets = 1;
  int iterations = 1;
  Duration duration = Duration.zero;
  int? weight;
  int? kcal;
  bool locationSpecific = false;
  
  final schedule = ToOne<TrainingsSchedule>(); // 1:N

  // // Makes it easier to view/print information about an object
  // @override
  // String toString() {
  //   return 'TrainingsElement{id: $id, name: $name, description: $description, sets: $sets, iterations: $iterations, duration: $duration, weight: $weight, kcal: $kcal, locationSpecific: $locationSpecific';
  // }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////       General CRUD Implementation Sequence       ///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Put a new object in the db box
void putElement(TrainingsElement element) {
  box.elementBox.put(element);
}

// Get an object by id from the db box
TrainingsElement? getElement(int id) {
  TrainingsElement? element = box.elementBox.get(id);
  return element;
}

// Get multiple objects by id from the db box
List<TrainingsElement?> getMultipleElements(List<int> ids) {
  List<TrainingsElement?> elements = box.elementBox.getMany(ids);
  return elements;
}

// Get all objects from the db box
List<TrainingsElement?> getAllElements() {
  List<TrainingsElement?> elements = box.elementBox.getAll();
  return elements;
}

// Remove the object from the db box using id
bool removeElement(int id) {
  final wasRemoved = box.elementBox.remove(id);
  return wasRemoved;
}

// Remove multiple objects from the db box using id
bool removeMultipleElements(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.elementBox.removeMany(ids);
  if(totalRemoved == totalToRemove) {
    // When everything is removed
    return true;
  }
  return false; // Else
}

// Remove all objects from the db box
bool removeAllElements({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.elementBox.count();
    final totalRemoved = box.elementBox.removeAll();
    if(totalRemoved == totalToRemove) {
      return true;
    }
  }

  return false;
}