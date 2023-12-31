import 'package:flutter/material.dart';
import 'package:minichallenge2/DonePage/donepage.dart';
import 'package:minichallenge2/TodoPage/pendingpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

///Creates the home page's main scaffolding and the state to change bertween pages

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  getDevice() {
    return MediaQuery.of(context).size.width <= 800 ? "Mobile" : "Tablet";
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    ///changes the selected page
    switch (selectedIndex) {
      case 0:
        page = PendingPage();
        break;
      case 1:
        page = DonePage();
        break;
      default:
        throw UnimplementedError("No Page for index $selectedIndex");
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(

          ///decides wether the screen size is big enough for a navigation rail or only a navbar
          body: constraints.maxWidth < 800
              ? Column(
                  children: [
                    ///place where the pages and appbars appear
                    Expanded(
                        child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: page,
                    )),

                    ///Creates the navbar where you can change between the pending and done tasks
                    SafeArea(
                        child: NavigationBar(
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.assignment),
                          label: 'Pending',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.done),
                          label: 'Done',
                        ),
                      ],
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                    )),
                  ],
                )
              : Row(
                  children: [
                    ///place where the pages and appbars appear
                    Expanded(
                        child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: page,
                    )),

                    ///Creates the navrail where you can change between the pending and done tasks
                    SafeArea(
                      child: NavigationRail(
                        extended: constraints.maxWidth > 700,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.assignment),
                            label: Text('Pending'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.done),
                            label: Text('Done'),
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onDestinationSelected: (value) {
                          setState(() {
                            selectedIndex = value;
                          });
                        },
                      ),
                    ),
                  ],
                ));
    });
  }
}
