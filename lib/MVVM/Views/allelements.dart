import 'package:workouttracker/abstracts/fileimports.dart';
import 'package:workouttracker/MVVM/Widgets/maindrawer.dart';

class AllElements extends StatefulWidget {
  const AllElements({super.key});

  @override
  State<AllElements> createState() => _AllElementsState();
}

class _AllElementsState extends State<AllElements> {
  List<TrainingsElement> allElements = getAllElements();

  Future<void> pullRefresh () async {
    setState(() {
      allElements = getAllElements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarTitleText(text: 'All Trainingselements'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new trainingselement',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/elements/create',
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          top: 20,
          right: 30,
          bottom: 10,
        ),
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          displacement: 10,
          child: ListView.builder(
            itemCount: allElements.length,
            itemBuilder: (context, index) {
              final TrainingsElement element = allElements[index];
              return ListTile(
                title: element.buildTitle(context),
                subtitle: element.buildContext(context),
                tileColor: const Color.fromARGB(255, 175, 175, 175),
                horizontalTitleGap: 10,
                onTap: () {},
              );
            },
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}