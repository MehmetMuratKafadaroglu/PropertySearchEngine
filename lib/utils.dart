import "package:flutter/material.dart";
import 'settings.dart';

sendAlert(String message, BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(Settings.alert),
        );
      });
}
