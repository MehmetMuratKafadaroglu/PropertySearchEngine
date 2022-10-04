import "package:flutter/material.dart";
import "../models.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  User getData() {
    return const User(1, "Dummy", "password", true, "lol", true, 123);
  }

  @override
  Widget build(BuildContext context) {
    final user = getData();
    return Text(user.email);
  }
}
