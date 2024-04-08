// ignore_for_file: non_constant_identifier_names

import 'package:workouttracker/abstracts/fileimports.dart';

const double _rowseperation = 15;
const double _formfieldwidth = 300;
const double _dropdownHeight = 200;
const int _dropdownLength = 15;

int dropdownMenuDurationSelection = 0;

class CreateElement extends StatefulWidget {
  const CreateElement({super.key});

  @override
  State<CreateElement> createState() => _CreateElementState();
}

class _CreateElementState extends State<CreateElement> {
  // properties
  String new_name = '';
  String new_description = '';
  int new_sets = 1;
  int new_iterations = 1;
  int new_duration = 0;
  int new_weight = 0;
  int new_kcal = 0;
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
    void createElement () {
      TrainingsElement createdElement = TrainingsElement();
      createdElement.name = name_controller.text;
      createdElement.description = description_controller.text;
      createdElement.sets = new_sets;
      createdElement.iterations = new_iterations;
      if (int.tryParse(kcal_controller.text) != null) createdElement.kcal = int.parse(kcal_controller.text);
      if (int.tryParse(weight_controller.text) != null) createdElement.weight = int.parse(weight_controller.text);
      createdElement.duration = new_duration;
      createdElement.locationSpecific = new_locationspecific;

      putElement(createdElement);
      Navigator.pop(context);
    }

    // Fill list for dropdown menu items
    List<DropdownMenuEntry> numericDropdownMenuDuration = [];
    List<DropdownMenuEntry> numericDropdownMenuSets = [];
    List<DropdownMenuEntry> numericDropdownMenuIterations = [];

    for (int i = 1; i <= _dropdownLength; i++) {
      numericDropdownMenuDuration.add(DropdownMenuEntry(value: i, label: "$i minutes"));
      numericDropdownMenuSets.add(DropdownMenuEntry(value: i, label: "$i sets"));
      numericDropdownMenuIterations.add(DropdownMenuEntry(value: i, label: "$i iterations"));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary,
        title: const Text(
          'Create an Exercise',
          style: appBarHeaderTextStyle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// NAME
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Name of Element",
                    labelStyle: regularTextStyle,
                    errorMaxLines: 1,
                  ),
                  style: regularTextStyle,
                  keyboardType: TextInputType.name,
                  controller: name_controller,
                ),
                const SizedBox(height: _rowseperation,),
                /// SETS
                DropdownMenu(
                  dropdownMenuEntries: numericDropdownMenuSets,
                  initialSelection: new_sets,
                  controller: sets_controller,
                  label: const Text(
                    'Sets',
                    style: regularTextStyle,
                  ),
                  menuHeight: _dropdownHeight,
                  width: _formfieldwidth,
                  onSelected: (selectedSets) {
                    setState(() {
                      new_sets = selectedSets;
                    });
                  },
                ),
                const SizedBox(height: _rowseperation,),
                /// ITERATIONS
                DropdownMenu(
                  dropdownMenuEntries: numericDropdownMenuIterations,
                  initialSelection: new_iterations,
                  controller: iterations_controller,
                  label: const Text(
                    'Iterations',
                    style: regularTextStyle,
                  ),
                  menuHeight: _dropdownHeight,
                  width: _formfieldwidth,
                  onSelected: (selectedIteration) {
                    setState(() {
                      new_iterations = selectedIteration;
                    });
                  },
                ),
                const SizedBox(height: _rowseperation,),
                /// WEIGHT IN KG
                SizedBox(
                  width: _formfieldwidth,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Weight in Kg',
                      labelStyle: regularTextStyle,
                      errorMaxLines: 1,
                    ),  
                    style: regularTextStyle,
                    keyboardType: TextInputType.number,
                    controller: weight_controller,
                  ),
                ),
                const SizedBox(height: _rowseperation,),
                /// KCAL
                SizedBox(
                  width: _formfieldwidth,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Amount of Kcal burned',
                      labelStyle: regularTextStyle,
                      errorMaxLines: 1,
                    ),
                    style: regularTextStyle,
                    keyboardType: TextInputType.number,
                    controller: kcal_controller,
                  ),
                ),
                const SizedBox(height: _rowseperation,),
                /// LOCATIONSPECIFIC
                CheckboxListTile(
                  title: const Text(
                    'Element only in BasicFit Heerlen',
                    style: regularTextStyle,
                  ),
                  value: new_locationspecific,
                  onChanged: (newValue) {
                    setState(() {
                      new_locationspecific = !new_locationspecific;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: _rowseperation,),
                /// ELEMENT DURATION
                DropdownMenu(
                  dropdownMenuEntries: numericDropdownMenuDuration,
                  initialSelection: dropdownMenuDurationSelection,
                  controller: duration_controller,
                  label: const Text(
                    'Duration of the element in minutes',
                    style: regularTextStyle,
                  ),
                  menuHeight: _dropdownHeight,
                  width: _formfieldwidth,
                  onSelected: (selectedDuration) {
                    setState(() {
                      dropdownMenuDurationSelection = selectedDuration;
                      new_duration = selectedDuration;
                    });
                  },
                ),
                const SizedBox(height: _rowseperation,),
                /// ELEMENT DESCRIPTION
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Element Description',
                    labelStyle: regularTextStyle,
                  ),
                  maxLines: null,
                  style: regularTextStyle,
                  keyboardType: TextInputType.multiline,
                  controller: description_controller,
                ),
                const SizedBox(height: _rowseperation,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: primairyButtonStyle,
                      onPressed: createElement,
                      child: const Text(
                        "Create Element",
                        style: primairyButtonTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    OutlinedButton(
                      style: secondairyButtonStyle,
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
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
      ),
    );
  }
}