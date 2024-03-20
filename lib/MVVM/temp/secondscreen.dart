import "package:flutter/material.dart";
import 'package:workouttracker/MVVM/Models/dog.dart';
import 'package:workouttracker/MVVM/temp/dogdetailpage.dart';

class SecondScreen extends StatefulWidget {
  List<Dog> dogs = [];
  SecondScreen({super.key, required this.dogs});

  @override
  State<SecondScreen> createState() => _SecondScreenState(dogs: dogs);
}

class _SecondScreenState extends State<SecondScreen> {
  List<Dog> dogs = [];
  _SecondScreenState({required this.dogs});

  Future<void> _stateSet() async {
    setState(() {
      _syncAllDogs();
    });
  }

  Future<void> _syncAllDogs() async {
    //dogs = await getAllDogs();
  }

  Future<void> pullRefresh() async {
    _stateSet();
  }

  @override
  Widget build(BuildContext context) {
    _syncAllDogs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Dogs'),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          displacement: 10,
          child: ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              final dog = dogs[index];
              return ListTile(
                title: dog.buildTitle(context),
                subtitle: dog.buildContext(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DogDetails(dog: dog)),
                  );
                },
              );
            },  
          ),
        ),
      ),
    );
  }
}