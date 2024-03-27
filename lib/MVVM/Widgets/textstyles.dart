import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

/// Detailspage property title
class DetailsTitleText extends StatelessWidget {
  final String text;
  const DetailsTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Detailspage property element
class DetailsElementText extends StatelessWidget {
  final String text;
  const DetailsElementText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w100,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.end,
    );
  }
}

/// Creationpage formtitle element
class FormElementTitleText extends StatelessWidget {
  final String text;
  const FormElementTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Appbar Title text
class AppBarTitleText extends StatelessWidget {
  final String text;
  const AppBarTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}

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

class LabelTextInputDecoration extends TextStyle {
  @override
  TextStyle build(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }
}

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