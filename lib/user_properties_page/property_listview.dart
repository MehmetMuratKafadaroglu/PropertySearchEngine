import "package:flutter/material.dart";
import 'property_widget.dart';
import '../settings.dart';
import '../models.dart';

class PropertyListview extends StatelessWidget {
  const PropertyListview({Key? key, required this.items}) : super(key: key);
  final List<PropertyWithImage> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text(Settings.noPropertyExistLabel);
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PropertyWidget(propertyWithImage: items.elementAt(index));
      },
    );
  }
}
