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