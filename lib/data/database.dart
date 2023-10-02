import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //reference our box
  final _mybox = Hive.box('mybox');

  List toDoList = [];
//run this while opening the app for the first time
  void createInitialData() {
    toDoList = [
      ["Create a ToDo App", false],
      ["Do Assignment", false],
    ];
  }

  //load data from the database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
