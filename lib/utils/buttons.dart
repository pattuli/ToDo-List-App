import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  Buttons({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.amber,
      child: Text(text),
    );
  }
}
