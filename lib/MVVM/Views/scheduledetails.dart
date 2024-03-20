import 'package:workouttracker/MVVM/Widgets/textstyles.dart';
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/MVVM/Widgets/maindrawer.dart';
import 'package:workouttracker/objectbox.g.dart'; // Import standard drawer

class ScheduleDetails extends StatelessWidget { 
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsSchedule selectedSchedule = ModalRoute.of(context)!.settings.arguments as TrainingsSchedule;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedSchedule.name} details",
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: "Delete schedule",
            onPressed: () {},
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
              child: Text(
                selectedSchedule.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const DetailsTitleText(text: 'Duration:'),
                DetailsElementText(text: '${selectedSchedule.duration.inMinutes} minutes'),
              ],
            ),
            Row(
              children: <Widget>[
                const DetailsTitleText(text: 'Kcal:'),
                DetailsElementText(text: '${selectedSchedule.kcal} kcal'),
              ],
            ),
            Row(
              children: <Widget>[
                const DetailsTitleText(text: 'Location specific:'),
                DetailsElementText(text: '${selectedSchedule.locationSpecific}'),
              ],
            ),
            Row(
              children: <Widget>[
                const DetailsTitleText(text: 'Trainee:'),
                DetailsElementText(text: '${selectedSchedule.trainee}'),
              ],
            ),
            const Divider(
              height: 3,
              thickness: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 90, 10, 175),
                shape: const RoundedRectangleBorder(),
                elevation: 10,
              ),
              child: const Text("View all trainings elements"),
            ),
          ],
        ),
      ),
    );
  }
}