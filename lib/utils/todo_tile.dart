import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletetask;
  ToDoTile({
    Key? key,
    required this.taskname,
    required this.taskcompleted,
    required this.onchanged,
    required this.deletetask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletetask,
              icon: Icons.delete,
              backgroundColor: Colors.lightBlue,
            )
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 147, 113, 244),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  //checkbox
                  Checkbox(
                    value: taskcompleted,
                    onChanged: onchanged,
                    activeColor: Color.fromARGB(255, 12, 12, 12),
                  ),
                  //task name
                  Text(
                    taskname,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: taskcompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationThickness: 2.0,
                        decorationColor: Color.fromARGB(255, 88, 84, 84)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
