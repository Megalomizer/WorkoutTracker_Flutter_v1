import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:workouttracker/MVVM/Models/dog.dart' as dogs;

class DogDetails extends StatelessWidget {
  final dogs.Dog dog;
  const DogDetails({super.key, required this.dog});

  final deletionSnackbar = const SnackBar(
    content: Text(
      'You have deleted a dog, please refresh to renew the list',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${dog.name} details'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete dog',
            onPressed: () async {
              await deleteDog();
              ScaffoldMessenger.of(context).showSnackBar(deletionSnackbar);
              Navigator.pop(context);
            },
          ), 
        ],
      ),
      body: _pageWidget(context, dog),
    );
  }

  Future<void> deleteDog() async {
    await dogs.deleteDog(dog.id);
  }

  Future<void> editDog() async {
    //TODO: Add edit page for dogs and redirect from here
  }

}

Widget _pageWidget(BuildContext	context, dogs.Dog dog) {
  return Container(
    margin: const EdgeInsets.only(
      left: 30,
      right: 30,
      top: 20,
      bottom: 10,
    ),
    child: Column(
      children: <Widget>[
        // Dog title
        Center(
          child: Text(
            dog.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        
        // Dog data
        Column(
          children: <Widget>[
            // Dog Age
            Container(
              margin: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 10,
                bottom: 0,
              ),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.punch_clock),
                  const SizedBox(width: 10),
                  const Text(
                    'Age:',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    dog.age.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 28,
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ],
    ),
  );
}