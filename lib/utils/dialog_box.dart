import 'package:flutter/material.dart';

import 'package:gadak/utils/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox(
      {Key? key,
      required this.onsave,
      required this.oncancel,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 147, 113, 244),
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //create a text field basically takes the input from the user
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Add a new task"),
          ),
          //buttons->save-cancel
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button

              //cancel button
              Buttons(text: "Cancel", onpressed: oncancel),
              SizedBox(
                width: 40,
              ),
              Buttons(text: "Save", onpressed: onsave)
            ],
          )
        ]),
      ),
    );
  }
}
