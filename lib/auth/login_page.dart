import 'package:app/auth/register_page.dart';
import 'package:app/request.dart';
import "package:flutter/material.dart";
import '../settings.dart';
import '../widgets/logo.dart';
import '../widgets/input_place.dart';
import '../models.dart';
import 'register_and_submit_button.dart';
import '../utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.changeParentState}) : super(key: key);
  final void Function() changeParentState;
  final InputPlace email =
      InputPlace(label: "Email", hint: Settings.exampleEmail);

  final InputPlace password = InputPlace(label: "Password", hint: "");

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void submit(BuildContext context) {
    User user =
        User.fromEmailandPassword(widget.email.value, widget.password.value);
    login(user, (int error) {
      if (error == -1) {
        sendAlert(Settings.serverErrorMessage, context);
        return;
      }
      if (error == 1) {
        sendAlert(Settings.passwordsDoesNotMatchMessage, context);
        return;
      }
      if (error == 3) {
        sendAlert(Settings.userDoesNotExistMessage, context);

        return;
      }
      if (error != 0) {
        sendAlert(Settings.genericErrorMessage, context);
        return;
      }
      widget.changeParentState();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(Settings.login),
        backgroundColor: Settings.secondaryBackgroundColor,
      ),
      backgroundColor: Settings.backgroundColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Logo(),
        widget.email,
        widget.password,
        Row(
          children: [SubmitButton(submit: submit), RegisterButton()],
        )
      ]),
    ));
  }
}
