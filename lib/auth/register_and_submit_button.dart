import "package:flutter/material.dart";
import '../settings.dart';
import 'register_page.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.submit}) : super(key: key);
  final void Function(BuildContext) submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () => submit(context),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                primary: Settings.secondaryBackgroundColor,
                textStyle: const TextStyle(fontSize: 20)),
            child: Text(Settings.submit)));
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Text(Settings.register));
  }
}
