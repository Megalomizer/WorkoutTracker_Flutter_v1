import 'package:workouttracker/abstracts/fileimports.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context); // Title line of the list item
  Widget buildContext(BuildContext context); // Context area of the list item
}