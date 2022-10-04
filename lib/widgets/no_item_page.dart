import "package:flutter/material.dart";

class NoItemPage extends StatelessWidget {
  const NoItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
