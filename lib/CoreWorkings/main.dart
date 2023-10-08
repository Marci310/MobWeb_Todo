import 'package:flutter/material.dart';
import 'package:minichallenge2/CoreWorkings/appstate.dart';
import 'package:minichallenge2/CoreWorkings/homepageandnav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  ///Creates the applications main body meaning, it creates the main appstate, sets the theme and creates the home page.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: HomePage(),
      ),
    );
  }
}
