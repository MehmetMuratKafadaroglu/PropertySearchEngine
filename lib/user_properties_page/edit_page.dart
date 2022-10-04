import 'package:app/home_page/sale_or_rent_selection.dart';
import 'package:app/widgets/input_place.dart';
import "package:flutter/material.dart";
import '../models.dart';
import '../settings.dart';
import '../widgets/label.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key, required this.item}) : super(key: key);
  final PropertyWithImage item;
  PropertyWithImage newItem = PropertyWithImage.empty();
  @override
  Widget build(BuildContext context) {
    InputPlace price =
        InputPlace(label: item.property.price.toString(), hint: "");
    SaleOrRentSelection selection = SaleOrRentSelection();
    selection.publishType =
        item.property.isForSale ? PublishType.sale : PublishType.rent;
    InputPlace numberOfRooms =
        InputPlace(label: item.property.numberOfRooms.toString(), hint: "");
    InputPlace location = InputPlace(label: item.property.location, hint: "");
    InputPlace address = InputPlace(label: item.property.address, hint: "");
    InputPlace internalArea =
        InputPlace(label: item.property.internalArea.toString(), hint: "");
    InputPlace title = InputPlace(label: item.property.title, hint: "");
    InputPlace description =
        InputPlace(label: item.property.description, hint: "");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.property.title),
          backgroundColor: Settings.secondaryBackgroundColor,
        ),
        backgroundColor: Settings.backgroundColor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Label(text: Settings.price, child: price), selection]),
      ),
    );
  }
}
