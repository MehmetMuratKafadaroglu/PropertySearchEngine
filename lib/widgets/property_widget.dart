import "package:flutter/material.dart";
import '../models.dart';
import '../settings.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({Key? key, required this.propertyWithImage})
      : super(key: key);
  final PropertyWithImage propertyWithImage;

  @override
  Widget build(BuildContext context) {
    Property property = propertyWithImage.property;
    List<PropertyImage> images = propertyWithImage.propertyImages;

    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 4, color: Colors.black)),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              images.isEmpty ? Settings.defaultImage : images[0].image),
          Text(
              "${property.numberOfRooms} ${Settings.room} ${property.type} ${Settings.forPrice} ${property.price} ${Settings.currency}"),
          Text("${Settings.added} ${property.date}"),
        ],
      ),
    );
  }
}
