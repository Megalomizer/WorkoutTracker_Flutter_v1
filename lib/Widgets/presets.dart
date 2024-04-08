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
const appBarHeaderTextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w500,
  color: color_secondairy,
);

/// Main-Header
const headerTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: color_black,
);

/// Sub-Header
const headerSubTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: color_black,
);

/// Regular Text
const regularTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: color_black,
);

/// Drawer Header
const drawerHeaderTextStyle = TextStyle(
  fontSize: 42,
  fontWeight: FontWeight.w700,
  color: color_secondairy,
);

/// Drawer Element
const drawerElementTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
  color: color_black,
);

/// Primary Button Text
const primairyButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: color_secondairy,
);

/// Secondairy Button Text
const secondairyButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w200,
  color: color_primary,
);
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
              child: const Text(
                'Home',
                style: drawerElementTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "All Schedules",
              style: drawerElementTextStyle,
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/schedules',
              )
            },
          ),
          ListTile(
            title: const Text(
              'All Elements',
              style: drawerElementTextStyle,
            ),
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
