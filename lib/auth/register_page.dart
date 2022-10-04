import 'package:app/request.dart';
import "package:flutter/material.dart";
import '../settings.dart';
import '../widgets/logo.dart';
import '../widgets/input_place.dart';
import '../models.dart';
import 'register_and_submit_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final InputPlace email =
      InputPlace(label: "Email", hint: Settings.exampleEmail);
  final InputPlace password = InputPlace(label: "Password", hint: "");
  final InputPlace passwordRepeat =
      InputPlace(label: "Password Repeat", hint: "");

  void submit(BuildContext context) {
    User user = User.fromEmailandPassword(email.value, password.value);
    register(user);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Settings.register),
          backgroundColor: Settings.secondaryBackgroundColor,
        ),
        backgroundColor: Settings.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            email,
            password,
            passwordRepeat,
            SubmitButton(submit: submit)
          ],
        ),
      ),
    );
  }
}
