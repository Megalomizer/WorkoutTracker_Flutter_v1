import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports
import 'package:workouttracker/MVVM/Widgets/maindrawer.dart'; // Import standard drawer

class AllSchedules extends StatefulWidget {
  const AllSchedules({super.key});

  @override
  State<AllSchedules> createState() => _AllSchedulesState();
}

class _AllSchedulesState extends State<AllSchedules> {
  final List<TrainingsSchedule> allSchedules = box.schedulesBox.getAll();

  Future<void> pullRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "All Schedules",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new schedule',
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
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          displacement: 10,
          child: ListView.builder(
            itemCount: allSchedules.length,
            itemBuilder: (context, index) {
              final TrainingsSchedule schedule = allSchedules[index];
              return ListTile(
                title: schedule.buildTitle(context),
                subtitle: schedule.buildContext(context),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/schedules/details',
                    arguments: schedule, //pass the TrainingsSchedule as an argument
                  );
                },
              );
            },
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}