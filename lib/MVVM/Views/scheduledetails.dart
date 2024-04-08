import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsSchedule selectedSchedule = ModalRoute.of(context)!.settings.arguments as TrainingsSchedule;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule details',
          style: appBarHeaderTextStyle,
        ),
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
              child: Text(
                selectedSchedule.name,
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Duration:',
                  style: regularTextStyle
                ),
                Text(
                  '${selectedSchedule.duration} minutes',
                  style: regularTextStyle
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Kcal:',
                  style: regularTextStyle
                ),
                Text(
                  '${selectedSchedule.kcal} kcal',
                  style: regularTextStyle
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Location specific:',
                  style: regularTextStyle
                ),
                Text(
                  '${selectedSchedule.locationSpecific}',
                  style: regularTextStyle
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Trainee:',
                  style: regularTextStyle
                ),
                Text(
                  '${selectedSchedule.trainee}',
                  style: regularTextStyle
                ),
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
              child: const Text(
                'View all trainings elements',
                style: primairyButtonTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}