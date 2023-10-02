import 'package:flutter/material.dart';
import 'package:gadak/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:gadak/pages/todo.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open a box
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        // initialRoute: "/todo",
        routes: {
          "/home": (context) => const HomePage(),
          // "/todo": (context) => ToDoList(),
        });
  }
}
