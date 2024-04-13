// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:workouttracker/abstracts/fileimports.dart';

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({super.key});

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  // used properties
  // List<TrainingsElement> scheduleElements = [];
  String new_name = "";
  bool new_locationspecific = false;

  // Form controllers
  final name_controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Dispose of all controllers for cleanup
  @override void dispose() {
    name_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TrainingsSchedule newSchedule = ModalRoute.of(context)!.settings.arguments as TrainingsSchedule;
    
    void createSchedule () {
      if (name_controller.text != null) {
        newSchedule.name = name_controller.text;
      }
      if (new_locationspecific != null) {
        newSchedule.locationSpecific = new_locationspecific;
      }
      if (activeUser != null) {
        newSchedule.trainee.target = activeUser;
      }

      int totalDuration = 0;
      int totalKcal = 0;

      newSchedule.scheduleItems.forEach((element) {
        totalDuration += element!.duration;
        totalKcal += element.kcal;
      });
      TrainingsElement? element = newSchedule.scheduleItems.firstWhere((element) => element!.locationSpecific == true);
      if (element != null || element!.locationSpecific == true) newSchedule.locationSpecific = true;

      newSchedule.duration = totalDuration;
      newSchedule.kcal = totalKcal;

      putSchedule(newSchedule);
    }

    Future<void> pullRefresh () async {
      setState(() {
        newSchedule = getSchedule(newSchedule.id)!;
      });
    } 
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary,
        title: const Text(
          'Create a schedule',
          style: appBarHeaderTextStyle
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 30,
              top: 20,
              right: 30,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /// NAME
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter a name',
                  ),
                  keyboardType: TextInputType.text,
                  controller: name_controller,
                ),
                const SizedBox(height: 20,),
                /// ELEMENTS
                Container(
                  height: 400,
                  width: 350,
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
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 0,
                          right: 15,
                          bottom: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Elements',
                              style: headerTextStyle,
                            ),
                            IconButton(
                              color: color_primary,
                              iconSize: 35,
                              icon: const Icon(Icons.add_circle_outline),
                              tooltip: 'Add Element',
                              onPressed: () {
                                Navigator.pushNamed(context, '/elements/create', arguments: newSchedule);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 275,
                        child: Divider(
                          height: 10,
                          thickness: 2.0,
                          color: color_primary,
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 200,
                          maxHeight: 200,
                        ),
                        margin: const EdgeInsets.only(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                        ),
                        child: SingleChildScrollView(
                          child: RefreshIndicator(
                            onRefresh: pullRefresh,
                            child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: newSchedule.scheduleItems.length,
                                itemBuilder: (context, index) {
                                  final TrainingsElement element = newSchedule.scheduleItems[index]!;
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      left: 5,
                                      top: 5,
                                      right: 5,
                                      bottom: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: color_white,
                                      border: Border.all(
                                        color: color_primary,
                                        width: 3.0,
                                        style: BorderStyle.solid,
                                        strokeAlign: BorderSide.strokeAlignInside,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {
                          createSchedule();
                          Navigator.pop(context);
                        },
                        style: primairyButtonStyle,
                        child: const Text(
                          'Create',
                          style: primairyButtonTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: OutlinedButton(
                        onPressed: () {
                          removeSchedule(newSchedule.id);
                          Navigator.pop(context);
                        },
                        style: secondairyButtonStyle,
                        child: const Text(
                          'Cancel',
                          style: secondairyButtonTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}