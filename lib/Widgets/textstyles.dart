import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

/// Listview ListItem title text
class ListItemTitle extends StatelessWidget {
  final String text;
  const ListItemTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Listview ListItem context text starting point
class ListItemContextStart extends StatelessWidget {
  final String text;
  const ListItemContextStart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Listview ListItem context text end point
class ListItemContextEnd extends StatelessWidget {
  final String text;
  const ListItemContextEnd({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Listview item drawer
class DrawerListItem extends StatelessWidget {
  final String text;
  const DrawerListItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w200,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Form labels
class LabelTextInputDecoration extends TextStyle {
  TextStyle build(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }
}

/// Form input fields
class FormTextInputField extends TextStyle {
  @override
  TextStyle build(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }
}