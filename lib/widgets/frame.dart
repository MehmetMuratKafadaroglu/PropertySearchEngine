import "package:flutter/material.dart";

class Frame extends StatelessWidget {
  const Frame({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: child,
    );
  }
}
