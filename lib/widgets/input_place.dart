import "package:flutter/material.dart";

class InputPlace extends StatelessWidget {
  InputPlace({Key? key, required this.label, required this.hint})
      : super(key: key);
  final String label, hint;
  final controller = TextEditingController();
  get value => controller.text;
  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: label, hintText: hint),
      ),
    );
  }
}
