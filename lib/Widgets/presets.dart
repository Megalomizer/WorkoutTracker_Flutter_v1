// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:workouttracker/abstracts/fileimports.dart';

//------------------ COLORS ------------------\\
/// Primairy color
const color_primary = Color.fromRGBO(96, 108, 56, 1);
/// Secondairy color
const color_secondairy = Color.fromRGBO(254, 250, 224, 1);
/// Border color
const color_border = Color.fromRGBO(40, 54, 24, 1);
/// Black color
const color_black = Color.fromRGBO(0, 0, 0, 1);
/// White color
const color_white = Color.fromRGBO(255, 255, 255, 1);
//--------------------------------------------\\

//------------------ Utility Styles ------------------\\
/// Primairy *Elevated* Button
final primairyButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: color_primary,
  elevation: 8.0,
  shape: const StadiumBorder(),
);

/// Secondairy *Outlined* Button
final secondairyButtonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(
    width: 5.0,
    color: color_primary,
  ),
);
//----------------------------------------------------\\

//------------------ Text Styles ------------------\\
/// Appbar Header
class AppBarHeaderTextStyle extends StatelessWidget {
  final String text;
  const AppBarHeaderTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: color_secondairy,
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Main-Header
class HeaderTextStyle extends StatelessWidget {
  final String text;
  const HeaderTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color_black,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Sub-Header
class HeaderSubTextStyle extends StatelessWidget {
  final String text;
  const HeaderSubTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color_black,
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Regular Text
class RegularTextStyle extends StatelessWidget {
  final String text;
  const RegularTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: color_black,
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Drawer Header
class DrawerHeaderTextStyle extends StatelessWidget {
  final String text;
  const DrawerHeaderTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: color_secondairy,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Drawer Element
class DrawerElementTextStyle extends StatelessWidget {
  final String text;
  const DrawerElementTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color_black,
      ),
      textAlign: TextAlign.start,
    );
  }
}

/// Primary Button Text
class PrimairyButtonTextStyle extends StatelessWidget {
  final String text;
  const PrimairyButtonTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color_secondairy,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Secondairy Button Text
class SecondairyButtonTextStyle extends StatelessWidget {
  final String text;
  const SecondairyButtonTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
        color: color_primary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
//-------------------------------------------------\\

//------------------ Custom Widgets ------------------\\
/// App Drawer
class DrawerPreset extends StatelessWidget {
  const DrawerPreset({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: color_secondairy,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: color_primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const DrawerHeaderTextStyle(text: 'Home'),
            ),
          ),
          ListTile(
            title: const DrawerElementTextStyle(text: 'All Schedules'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/schedules',
              )
            },
          ),
          ListTile(
            title: const DrawerElementTextStyle(text: 'All Elements'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/elements',
              );
            },
          )
        ],
      ),
    );
  }
}
//----------------------------------------------------\\
