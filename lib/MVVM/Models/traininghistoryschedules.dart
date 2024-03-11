import 'package:objectbox/objectbox.dart';

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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////