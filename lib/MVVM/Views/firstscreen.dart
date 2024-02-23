import "package:flutter/material.dart";
import "package:path/path.dart";
import "package:workouttracker/MVVM/Views/fourthscreen.dart";

class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context){
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

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 34, 101, 138),
            elevation: 10,
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FourthScreen()),
            )
          },
          child: const Text('Create Dog'),
        ),
      ],
    );
  }
}