// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:workouttracker/abstracts/fileimports.dart';

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({super.key});

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  // used properties
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Create a new Schedule',
          style: appBarHeaderTextStyle
        ),
      ),
      body: Form(
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
              const Text(
                'Schedule name',
                style: regularTextStyle
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter a name',
                ),
                keyboardType: TextInputType.text,
                controller: name_controller,
              ),
              const SizedBox(height: 20,),
              const Text(
                'Schedule location specific',
                style: regularTextStyle,
              ),
              Switch(
                value: new_locationspecific,
                onChanged: (bool newValue) {
                  setState(() {
                    new_locationspecific = !new_locationspecific;
                  });
                }
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton( // Create schedule
                    onPressed: () {
                      _createSchedule();
                      Navigator.pop(context);
                    },
                    style: primairyButtonStyle,
                    child: const Text(
                      'Create',
                      style: primairyButtonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  OutlinedButton( // Cancel creation
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: secondairyButtonStyle,
                    child: const Text(
                      'Cancel',
                      style: secondairyButtonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createSchedule () {
    TrainingsSchedule createdSchedule = TrainingsSchedule();
    if (name_controller.text != null) {
      createdSchedule.name = name_controller.text;
    }
    if (new_locationspecific != null) {
      createdSchedule.locationSpecific = new_locationspecific;
    }
    if (activeUser != null) {
      createdSchedule.trainee.target = activeUser;
    }
    putSchedule(createdSchedule);
  }
}