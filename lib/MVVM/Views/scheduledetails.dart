import 'package:workouttracker/Widgets/presets.dart';
import 'package:workouttracker/Widgets/textstyles.dart';
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/objectbox.g.dart'; // Import standard drawer

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsSchedule selectedSchedule = ModalRoute.of(context)!.settings.arguments as TrainingsSchedule;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarHeaderTextStyle(text: 'Schedule details'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: "Delete schedule",
            onPressed: () {
              removeSchedule(selectedSchedule.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: "Edit schedule",
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: HeaderTextStyle(text: selectedSchedule.name),
            ),
            Row(
              children: <Widget>[
                const RegularTextStyle(text: 'Duration:'),
                RegularTextStyle(text: '${selectedSchedule.duration.inMinutes} minutes'),
              ],
            ),
            Row(
              children: <Widget>[
                const RegularTextStyle(text: 'Kcal:'),
                RegularTextStyle(text: '${selectedSchedule.kcal} kcal'),
              ],
            ),
            Row(
              children: <Widget>[
                const RegularTextStyle(text: 'Location specific:'),
                RegularTextStyle(text: '${selectedSchedule.locationSpecific}'),
              ],
            ),
            Row(
              children: <Widget>[
                const RegularTextStyle(text: 'Trainee:'),
                RegularTextStyle(text: '${selectedSchedule.trainee}'),
              ],
            ),
            const Divider(
              height: 3,
              thickness: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            ElevatedButton(
              onPressed: () {},
              style: primairyButtonStyle,
              child: const PrimairyButtonTextStyle(text: 'View all trainings elements'),
            ),
          ],
        ),
      ),
    );
  }
}