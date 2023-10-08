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
          body: Column(
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
              destinations: [
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
            ),
          ),
        ],
      ));
    });
  }
}
