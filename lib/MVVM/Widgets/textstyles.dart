import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

// Detailspage property title
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

// Detailspage property element
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

// Creationpage formtitle element
class FormElementTitleText extends StatelessWidget {
  final String text;
  const FormElementTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.center,
    );
  }
}

// Appbar Title text
class AppBarTitleText extends StatelessWidget {
  final String text;
  const AppBarTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      textAlign: TextAlign.start,
    );
  }
}