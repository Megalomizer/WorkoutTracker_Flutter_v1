import "package:flutter/material.dart";
import "package:path/path.dart";

import "package:workouttracker/MVVM/Views/fourthscreen.dart";
import "package:workouttracker/MVVM/Views/secondscreen.dart";

import 'package:workouttracker/MVVM/Models/dog.dart';

class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context){
    List<Dog> dogs = [];
    Future<void> syncListDogs() async {
      dogs = await getAllDogs();
    }
    syncListDogs();

    return Column(
      children: <Widget>[
        const Text(
          "it is a tab where you can view some stuff",
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),

        // Text field
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter something here',
            ),
          ),
        
        ),
        // login field
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 34, 101, 138),
                elevation: 10,
              ),
              onPressed: () => {
                syncListDogs(),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(dogs: dogs)),
                )
              },
              child: const Text(
                'See All Dogs',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 34, 101, 138),
                elevation: 10,
            ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthScreen()),
                )
              },
              child: const Text(
                'Create new Dog',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}