import "package:flutter/material.dart";

class Label extends StatelessWidget {
  const Label({Key? key, required this.text, required this.child})
      : super(key: key);
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(3.0),
        child: Column(children: [Text(text), child]));
  }
}
