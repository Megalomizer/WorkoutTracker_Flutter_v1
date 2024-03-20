import 'package:workouttracker/abstracts/fileimports.dart'; // All imports

// Main app body
class MainBody extends StatelessWidget {
  //final BuildContext context;
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        top: 20,
        right: 30,
        bottom: 10,
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/schedules'
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 90, 10, 175),
                shape: const RoundedRectangleBorder(),
                elevation: 10,
              ),
              child: const Text(
                "Show all schedules",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}