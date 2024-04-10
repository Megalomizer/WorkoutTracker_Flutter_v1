import 'package:workouttracker/abstracts/fileimports.dart';

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
        backgroundColor: color_primary,
        title: const Text(
          'All Exercises',
          style: appBarHeaderTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add new trainingselement',
            onPressed: () => Navigator.pushNamed(context, '/elements/create', ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 10,
        ),
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          displacement: 10,
          child: ListView.builder(
            itemCount: allElements.length,
            itemBuilder: (context, index) {
              final TrainingsElement element = allElements[index];
              return Container(
                margin: const EdgeInsets.only(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: color_secondairy,
                  border: Border.all(
                      color: color_primary,
                      width: 4.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0)
                  ),
                ),
                child: ListTile(
                  title: element.buildTitle(context),
                  subtitle: element.buildContext(context),
                  tileColor: Colors.transparent,
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ),
      drawer: const DrawerPreset(),
    );
  }
}