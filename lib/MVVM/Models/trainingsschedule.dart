import 'package:objectbox/objectbox.dart';

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