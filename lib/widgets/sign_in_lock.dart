import "package:flutter/material.dart";
import '../settings.dart';

class SignInLock extends StatelessWidget {
  const SignInLock({Key? key, required this.redirectTo}) : super(key: key);
  final Widget redirectTo;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => redirectTo));
        },
        icon: Icon(Icons.lock),
        label: Text(Settings.login));
  }
}
