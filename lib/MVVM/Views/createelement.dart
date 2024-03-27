// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

const double? _widgetseperation = 20;

const double? _rowseperation = 37;
const double? _formfieldwidth = 125;

class CreateElement extends StatefulWidget {
  const CreateElement({super.key});

  @override
  State<CreateElement> createState() => _CreateElementState();
}

class _CreateElementState extends State<CreateElement> {
  // properties
  String? new_name = '';
  String? new_description = '';
  int? new_sets = 1;
  int? new_iterations = 1;
  Duration? new_duration = const Duration(hours: 0, minutes: 0, seconds: 0);
  int? new_weight = 0;
  int? new_kcal = 0;
  bool new_locationspecific = false;

  // controllers
  final name_controller = TextEditingController();
  final description_controller = TextEditingController();
  final sets_controller = TextEditingController();
  final iterations_controller = TextEditingController();
  final duration_controller = TextEditingController();
  final weight_controller = TextEditingController();
  final kcal_controller = TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  // Dispose all controllers
  @override void dispose() {
    name_controller.dispose();
    description_controller.dispose();
    sets_controller.dispose();
    iterations_controller.dispose();
    duration_controller.dispose();
    weight_controller.dispose();
    kcal_controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _createElement () {
      TrainingsElement createdElement = TrainingsElement();
    }

    Future<void> _selectTimeDuration () async {
      TimeOfDay _time = const TimeOfDay(hour: 0, minute: 0);
      final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: _time,
      );
      if(newTime != null) {
        setState(() {
          _time = newTime;
          new_duration = Duration(hours: _time.hour, minutes: _time.minute);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: "Enter a name",
                  labelStyle: LabelTextInputDecoration(),
                  errorMaxLines: 1,
                ),
                style: FormTextInputField(),
                keyboardType: TextInputType.name,
                controller: name_controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      FormElementTitleText(text: "Amount of sets:"),
                      SizedBox(height: _rowseperation,),
                      FormElementTitleText(text: "Amount of iterations:"),
                      SizedBox(height: _rowseperation,),
                      FormElementTitleText(text: "Weight in Kg:"),
                      SizedBox(height: _rowseperation,),
                      FormElementTitleText(text: "Amount of Kcal:"),
                      SizedBox(height: _rowseperation,),
                      FormElementTitleText(text: "Location specific:"),
                      SizedBox(height: _rowseperation,),
                      FormElementTitleText(text: "Duration:"),
                    ],
                    ),
                  const Column(
                    children: <Widget>[
                      SizedBox(width: 30,),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: _formfieldwidth,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Sets',
                            labelStyle: LabelTextInputDecoration(),
                            errorMaxLines: 1,
                          ),  
                          style: FormTextInputField(),
                            keyboardType: TextInputType.number,
                          controller: sets_controller,
                        ),
                      ),
                      SizedBox(
                        width: _formfieldwidth,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Iterations',
                            labelStyle: LabelTextInputDecoration(),
                            errorMaxLines: 1,
                          ),
                          style: FormTextInputField(),
                          keyboardType: TextInputType.number,
                          controller: iterations_controller,
                        ),
                      ),
                      SizedBox(
                        width: _formfieldwidth,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Weight in Kg',
                            labelStyle: LabelTextInputDecoration(),
                            errorMaxLines: 1,
                          ),  
                          style: FormTextInputField(),
                          keyboardType: TextInputType.number,
                          controller: weight_controller,
                        ),
                      ),
                      SizedBox(
                        width: _formfieldwidth,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'Amount of Kcal',
                            labelStyle: LabelTextInputDecoration(),
                            errorMaxLines: 1,
                          ),
                          style: FormTextInputField(),
                          keyboardType: TextInputType.number,
                          controller: kcal_controller,
                        ),
                      ),
                      Switch(
                        value: new_locationspecific,
                        onChanged: (bool value) {
                          setState(() {
                            new_locationspecific = !new_locationspecific;
                          });
                        },
                      ),
                      // ElevatedButton(
                      //   onPressed: _selectTimeDuration,
                      //   child: const Text("Select Time"),
                      // ),
                      //Text("Selected time: $new_duration"),
                      TextButton(
                        onPressed: _selectTimeDuration,
                        child: Text(
                          '$new_duration',
                        ),
                      ) 
                    ],
                  ),
                ],
              ),
              const SizedBox(height: _rowseperation,),
              const FormElementTitleText(text: "Description:"),
              TextFormField(
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Describe the element',
                  labelStyle: LabelTextInputDecoration(),
                ),
                style: FormTextInputField(),
                keyboardType: TextInputType.multiline,
                controller: description_controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}