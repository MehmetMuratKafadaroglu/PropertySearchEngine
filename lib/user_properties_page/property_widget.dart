import 'package:app/request.dart';
import "package:flutter/material.dart";
import '../settings.dart';
import '../models.dart';
import 'edit_page.dart';

class PropertyWidget extends StatefulWidget {
  PropertyWidget({Key? key, required this.propertyWithImage}) : super(key: key);
  final PropertyWithImage propertyWithImage;
  bool show = true;
  @override
  State<PropertyWidget> createState() => _PropertyWidgetState();
  void deleteFromDB() =>
      PropertyActionRequest.fromProperty(propertyWithImage.property).delete();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  @override
  Widget build(BuildContext context) {
    void edit() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EditPage(item: widget.propertyWithImage);
      }));
    }

    void delete() {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return AlertDialog(
              title: Text(Settings.alert),
              content: Text(Settings.confirmationMessage),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(Settings.cancel)),
                TextButton(
                    onPressed: () {
                      widget.deleteFromDB();
                      setState(() {
                        widget.show = false;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(Settings.delete)),
              ],
            );
          });
    }

    Property property = widget.propertyWithImage.property;
    List<PropertyImage> images = widget.propertyWithImage.propertyImages;

    return Visibility(
        visible: widget.show,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 8, color: Colors.black)),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  images.isEmpty ? Settings.defaultImage : images[0].image),
              Text(
                  "${property.numberOfRooms} ${Settings.room} ${property.type} ${Settings.forPrice} ${property.price} ${Settings.currency}"),
              Text("${Settings.added} ${property.date}"),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black)),
              ),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: edit,
                      icon: Icon(Icons.edit),
                      label: Text(Settings.edit)),
                  TextButton.icon(
                      onPressed: delete,
                      icon: Icon(Icons.delete),
                      label: Text(Settings.delete)),
                ],
              )
            ],
          ),
        ));
  }
}
