import 'package:objectbox/objectbox.dart';

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