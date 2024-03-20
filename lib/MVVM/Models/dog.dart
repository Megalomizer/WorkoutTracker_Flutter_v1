// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:workouttracker/main.dart';
import 'package:workouttracker/abstracts/databaseconfig.dart' as dbconfig;

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:workouttracker/MVVM/Widgets/listitem.dart';

/// Define class
class Dog implements ListItem{
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert Dog to a Map -> Keys must correspond to the columns in the database!
  Map<String, Object?> toMap(){
    return {
      'name': name,
      'age': age,
    }; //ID is autoincremented
  }

  /// Override the toString method of the Dog class
  /// makes it easier to see information about each dog
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }

  // Implement ListItem Widgets
  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }

  @override
  Widget buildContext(BuildContext context) {
    return Text(
      'Dog{id: $id, name: $name, age: $age}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }

}

/// Insert a dog into the database
Future<void> insertDog(Dog dog) async {
  // // get a reference to the database
  // Future<Database> database = dbconfig.getDatabase();
  // final db = await database;

  // // Insert Dog into the database
  // await db.insert(
  //   'dogs',
  //   dog.toMap(),
  //   conflictAlgorithm: ConflictAlgorithm.replace, // If it exists -> replace
  // );
}

/// Get a list of all dogs in the database
void getAllDogs() async {
  // Future<Database> database = dbconfig.getDatabase();
  // final db = await database;

  // // query the table for all the dogs
  // final List<Map<String, Object?>> allDogs = await db.query('dogs');

  // // convert to a list of objects
  // return [
  //   for(final {
  //     'id': id as int,
  //     'name': name as String,
  //     'age': age as int,
  //     } in allDogs)
  //     Dog(id: id, name: name, age: age),
  // ];
}

/// Update an entry of Dog in the database
Future<void> updateDog(Dog dog) async {
  // Future<Database> database = dbconfig.getDatabase();
  // final db = await database;

  // await db.update(
  //   'dogs',
  //   dog.toMap(),
  //   where: 'id = ?', // ensure that dog has matching id
  //   whereArgs: [dog.id], // pass dog.id as whereArgs to prevent SQL injection
  // );
}

/// Delete an entry if Dog in the database by ID
Future<void> deleteDog(int id) async {
  // Future<Database> database = dbconfig.getDatabase();
  // final db = await database;

  // await db.delete(
  //   'dogs',
  //   where: 'id = ?',
  //   whereArgs: [id],
  // );
}