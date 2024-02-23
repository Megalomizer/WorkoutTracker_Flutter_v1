import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:workouttracker/MVVM/Models/dog.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

//TODO: Fix the layout so it is more spaced

class _FourthScreenState extends State<FourthScreen> {
  int newAge = 0;
  String newName = "";

  final dogNameController = TextEditingController();
  final dogAgeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override void dispose() {
    dogNameController.dispose();
    dogAgeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new Dog"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter a new Dog!",
            ),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your dogs name',
              ),
              keyboardType: TextInputType.text,
              controller: dogNameController,
            ),

            TextFormField(
              decoration: const InputDecoration(
                border:UnderlineInputBorder(),
                labelText: 'Enter your dogs age',
              ),
              keyboardType: TextInputType.number,
              controller: dogAgeController,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please enter the age of your dog';
                }
                return null;
              },
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 34, 101, 138),
                    elevation: 0,
                  ),
                  onPressed: createNewDog,
                  child: const Text(
                    'Save Dog',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 34, 101, 138),
                    )
                  ),
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 101, 138),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  void createNewDog(){
    if(dogNameController.text.isEmpty || dogNameController.text == ""){
      //FIXME: no null restrictions yet -> https://stackoverflow.com/questions/53424916/textfield-validation-in-flutter
    }

    String name = dogNameController.text;
    int age = int.parse(dogAgeController.text);

    Dog newDog = Dog(
      id: 0, 
      name: name, 
      age: age
    );

    insertDog(newDog);
  }
}