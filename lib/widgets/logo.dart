import "package:flutter/material.dart";

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 190.0,
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      child: Center(
        child: Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
