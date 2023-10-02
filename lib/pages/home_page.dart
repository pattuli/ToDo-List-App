import 'package:flutter/material.dart';
import 'package:gadak/data/database.dart';
import 'package:gadak/utils/dialog_box.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the hive box
  final _myBox = Hive.box('mybox');
  //instance of the class tododatabase
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if first time opening the app, creae default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void savenewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

//create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          oncancel: () => Navigator.of(context).pop(),
          onsave: savenewtask,
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Todo List")),
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      // backgroundColor: Colors.purple,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.toDoList[index][0],
            taskcompleted: db.toDoList[index][1],
            onchanged: (value) {
              checkBoxChanged(value, index);
            },
            deletetask: (context) => deletetask(index),
          );
        },
        itemCount: db.toDoList.length,
      ),
    );
  }
}
