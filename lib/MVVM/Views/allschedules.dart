import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

class AllSchedules extends StatefulWidget {
  const AllSchedules({super.key});

  @override
  State<AllSchedules> createState() => _AllSchedulesState();
}

class _AllSchedulesState extends State<AllSchedules> {
  List<TrainingsSchedule> allSchedules = box.schedulesBox.getAll();

  Future<void> pullRefresh () async {
    setState(() {
      allSchedules = box.schedulesBox.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary,
        title: const Text(
          'All Schedules',
          style: appBarHeaderTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new schedule',
            onPressed: () {
              TrainingsSchedule newSchedule = TrainingsSchedule();
              putSchedule(newSchedule);
              Navigator.pushNamed(context, '/schedules/create', arguments: newSchedule);
            }
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 10,
        ),
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          displacement: 10,
          child: ListView.builder(
            itemCount: allSchedules.length,
            itemBuilder: (context, index) {
              final TrainingsSchedule schedule = allSchedules[index];
              return Container(
                margin: const EdgeInsets.only(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: color_secondairy,
                  border: Border.all(
                      color: color_primary,
                      width: 4.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0)
                  ),
                ),
                child: ListTile(
                  title: schedule.buildTitle(context),
                  subtitle: schedule.buildContext(context),
                  tileColor: Colors.transparent,
                  horizontalTitleGap: 10,
                  onTap: () => Navigator.pushNamed(context, '/schedules/details', arguments: schedule,),
                ),
              );
            },
          ),
        ),
      ),
      drawer: const DrawerPreset(),
    );
  }
}