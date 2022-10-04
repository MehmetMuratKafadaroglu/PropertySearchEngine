import "package:flutter/material.dart";
import "../settings.dart";

class GoBackButton extends StatelessWidget {
  GoBackButton({
    Key? key,
    required this.back,
    required this.label,
  }) : super(key: key);
  void Function() back;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: back,
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            bool isPressed = states.contains(MaterialState.pressed);
            return isPressed ? Colors.white : null;
          }),
          backgroundColor: MaterialStateProperty.all(Settings.backgroundColor)),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
