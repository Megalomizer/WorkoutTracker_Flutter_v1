import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

class ElementDetails extends StatelessWidget {
  const ElementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsElement selectedElement = ModalRoute.of(context)!.settings.arguments as TrainingsElement;

    String locationTag = "All Locations";
    if (selectedElement.locationSpecific) {
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
            icon: const Icon(Icons.edit),
            tooltip: "Edit element",
            onPressed: () {},
          ),
          IconButton(
            color: color_secondairy,
            icon: const Icon(Icons.delete),
            tooltip: "Delete element",
            onPressed: () {
              removeSchedule(selectedElement.id);
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
              selectedElement.name!,
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
                              '${selectedElement.duration} minutes',
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
                              '${selectedElement.kcal} kcal',
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
                    /// WEIGHT/DIFFICULTY
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
                            Icons.fitness_center,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Difficulty ${selectedElement.weight}',
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
                    /// SETS
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
                            Icons.workspaces,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${selectedElement.sets} sets',
                              style: regularTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// ITERATIONS
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
                            Icons.restart_alt,
                            color: color_primary,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${selectedElement.iterations} times',
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
            /// DESCRIPTION --> Element details
            Container(
              height: 125,
              width: 400,
              padding: const EdgeInsets.all(1.0),
              margin: const EdgeInsets.only(
                left: 0,
                top: 10,
                right: 0,
                bottom: 10,
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
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 1,),
                  const Text(
                    "Description",
                    style: headerSubTextStyle,
                  ),
                  const SizedBox(height: 1,),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      height: 0,
                      thickness: 2.0,
                      color: color_primary,
                    ),
                  ),
                  const SizedBox(height: 1,),
                  Container(
                    margin: const EdgeInsets.all(1.0),
                    width: 250,
                    child: Text(
                      selectedElement.description!,
                      style: regularTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}