import 'package:objectbox/objectbox.dart';
import 'package:workouttracker/abstracts/fileimports.dart';
import 'package:workouttracker/Widgets/listitem.dart';

@Entity()
class TrainingsSchedule implements ListItem {
  /// properties
  @Id()
  int id = 0;
  @Index(type: IndexType.value)
  String name = "";
  int duration = 0;
  int kcal = 0;
  bool locationSpecific = false;
  @Backlink('schedule')
  List<TrainingsElement?> scheduleItems = ToMany<TrainingsElement>(); // 1:N
  List<int> scheduleItemsIds = <int>[];
  final trainee = ToOne<Trainee>(); // 1:N

  /// Implement Widget from ListItem
  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      name,
      style: cardTitleStyle,
    );
  }

  @override
  Widget buildContext(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            const Text(
              'Duration',
              style: regularTextStyle,
            ),
            const SizedBox(width: 20,),
            Text(
              '$duration minutes',
              style: regularTextStyle
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            const Text(
              'Kcal',
              style: regularTextStyle,
            ),
            const SizedBox(width: 20,),
            Text(
              '$kcal kcal',
              style: regularTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||//
//|||||||||||||||||||||||||||||||||||||||||||||//      General CRUD Implementation Sequence          //|||||||||||||||||||||||||||||||||||||||||||||// 
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||//

/// Put a new object in the db box
int? putSchedule(TrainingsSchedule schedule) {
  if (schedule.scheduleItems.isNotEmpty) {
    for (TrainingsElement? element in schedule.scheduleItems) {
      schedule.duration += element!.duration;
      schedule.kcal += element.kcal;
      if (element.locationSpecific == true) schedule.locationSpecific = true;
    }
  }
  
  int id = box.schedulesBox.put(schedule);
  return id;
}

/// Connect Trainingsschedule tot elements
TrainingsSchedule? connectSchedule(TrainingsSchedule schedule) {
  List<TrainingsElement?> elements = getMultipleElements(schedule.scheduleItemsIds);
  for (TrainingsElement? element in elements) {
    if (element != null) schedule.scheduleItems.add(element);
  }
  return schedule;
}

/// Get an object by id from the db box
TrainingsSchedule? getSchedule(int id) {
  TrainingsSchedule? schedule = box.schedulesBox.get(id);
  if (schedule!.scheduleItemsIds.isNotEmpty) connectSchedule(schedule);
  return schedule;
}

/// Get multiple objects by id from the db box
List<TrainingsSchedule?> getMultipleSchedules(List<int> ids) {
  List<TrainingsSchedule?> schedules = box.schedulesBox.getMany(ids);
  for (TrainingsSchedule? element in schedules) {
    element = connectSchedule(element!);
  }
  return schedules;
}

/// Get all objects from the db box
List<TrainingsSchedule?> getAllSchedules() {
  List<TrainingsSchedule?> schedules = box.schedulesBox.getAll();
  for (TrainingsSchedule? element in schedules) {
    element = connectSchedule(element!);
  }
  return schedules;
}

/// Remove the object from the db box using id
bool removeSchedule(int id) {
  final wasRemoved = box.schedulesBox.remove(id);
  return wasRemoved;
}

/// Remove multiple objects from the db box using id
bool removeMultipleSchedules(List<int> ids) {
  final totalToRemove = ids.length;
  final totalRemoved = box.schedulesBox.removeMany(ids);
  if(totalRemoved == totalToRemove) return true; // When everything is removed
  return false; // Else
}

/// Remove all objects from the db box
bool removeAllSchedules({bool? check = false}) {
  if(check == true) {
    final totalToRemove = box.schedulesBox.count();
    final totalRemoved = box.schedulesBox.removeAll();
    if(totalRemoved == totalToRemove) return true; // When everything is removed
  }
  return false;
}