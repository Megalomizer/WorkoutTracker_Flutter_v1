import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsSchedule selectedSchedule = ModalRoute.of(context)!.settings.arguments as TrainingsSchedule;

    String locationTag = "All Locations";
    if (selectedSchedule.locationSpecific) {
      locationTag = "Heerlen Only";
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary,
        title: const Text(
          'Details',
          style: appBarHeaderTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            color: color_secondairy,
            icon: const Icon(Icons.history),
            tooltip: "View History",
            onPressed: () {},
          ),
          IconButton(
            color: color_secondairy,
            icon: const Icon(Icons.edit),
            tooltip: "Edit schedule",
            onPressed: () {},
          ),
          IconButton(
            color: color_secondairy,
            icon: const Icon(Icons.delete),
            tooltip: "Delete schedule",
            onPressed: () {
              removeSchedule(selectedSchedule.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 10,
          right: 20,
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            /// NAME
            Text(
              selectedSchedule.name,
              style: headerTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.only(
                left: 0,
                top: 0,
                right: 0,
                bottom: 10,
              ),
              child: const Divider(
                height: 2.0,
                thickness: 2.0,
                color: color_primary,
              ),
            ),
            /// CARDS DATA
            Table(
              children: [
                TableRow(
                  children: [
                    /// DURATION
                    Container(
                      height: 75,
                      margin: const EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: color_secondairy,
                        border: Border.all(
                          color: color_primary,
                          width: 4.0,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.timer,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${selectedSchedule.duration} minutes',
                              style: regularTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// KCAL
                    Container(
                      height: 75,
                      margin: const EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 0,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: color_secondairy,
                        border: Border.all(
                          color: color_primary,
                          width: 4.0,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.local_fire_department,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${selectedSchedule.kcal} kcal',
                              style: regularTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    /// LOCATION SPECIFIC
                    Container(
                      height: 75,
                      margin: const EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: color_secondairy,
                        border: Border.all(
                          color: color_primary,
                          width: 4.0,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.location_pin,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              locationTag,
                              style: regularTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// AMOUNT USED
                    Container(
                      height: 75,
                      margin: const EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 0,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: color_secondairy,
                        border: Border.all(
                          color: color_primary,
                          width: 4.0,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(
                            Icons.repeat,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'coming soon',
                              style: regularTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            /// TRAININGSELEMENTS
            Container(
              height: 325,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: color_secondairy,
                border: Border.all(
                  color: color_primary,
                  width: 4.0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  const Text(
                    "Elements",
                    style: headerSubTextStyle,
                  ),
                  const SizedBox(height: 5,),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      height: 0,
                      thickness: 2.0,
                      color: color_primary,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 200,
                      maxHeight: 200,
                    ),
                    margin: const EdgeInsets.only(
                      left: 0,
                      top: 5,
                      right: 0,
                      bottom: 5,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        height: 200,
                        padding: const  EdgeInsets.only(
                          left: 5,
                          top: 0,
                          right: 5,
                          bottom: 0,
                        ),
                        child: ListView.builder(
                          itemCount: selectedSchedule.scheduleItems.length,
                          itemBuilder: (context, index) {
                            final TrainingsElement element = selectedSchedule.scheduleItems[index]!;
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                color: color_tertaire,
                                border: Border.all(
                                  color: color_primary,
                                  width: 3.0,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0)
                                ),
                              ),
                              child: ListTile(
                                title: element.buildTitle(context),
                                subtitle: element.buildContext(context),
                                tileColor: Colors.transparent,
                                horizontalTitleGap: 5,
                                onTap: () => Navigator.pushNamed(context, '/elements/details', arguments: element),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: primairyButtonStyle,
                onPressed: () {},
                child: const Text(
                  'Use Schedule',
                  style: primairyButtonTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}