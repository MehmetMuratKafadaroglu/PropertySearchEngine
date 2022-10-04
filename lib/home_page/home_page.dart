import 'package:app/request.dart';
import "package:flutter/material.dart";
import '../models.dart';
import '../widgets/back_button.dart';
import '../settings.dart';
import '../widgets/label.dart';
import '../widgets/no_item_page.dart';
import '../widgets/range.dart';
import '../widgets/property_listview.dart';
import '../data.dart';
import './sale_or_rent_selection.dart';
import '../utils.dart';

PropertyRequest request = PropertyRequest('', true);

class PropertyPage extends StatelessWidget {
  const PropertyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void back() {
      Navigator.pop(
        context,
      );
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Settings.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoBackButton(
                  back: back,
                  label: Settings.filter,
                ),
                Expanded(
                  child: FutureBuilder<List<PropertyWithImage>>(
                      future: request.fetchProperties(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? PropertyListView(items: snapshot.data ?? [])
                            : NoItemPage();
                      }),
                )
              ],
            )));
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final Range price = Range(end: 20, unit: 1000, title: Settings.price);
  final Range bedrooms = Range(end: 10, unit: 1, title: Settings.bedrooms);
  final Range internalArea =
      Range(end: 50, unit: 10, title: Settings.internalArea);
  String location = '';
  final SaleOrRentSelection saleOrRentSelection = SaleOrRentSelection();

  void fillRequestObject() {
    request.location = location;
    request.maxPrice = price.max;
    request.minPrice = price.min;
    request.maxRooms = bedrooms.max;
    request.minRooms = bedrooms.min;
    request.maxInternalArea = internalArea.max;
    request.minInternalArea = internalArea.min;
    request.isForSale = saleOrRentSelection.publishType == PublishType.sale;
  }

  void changeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PropertyPage()));
  }

  void apply(BuildContext context) {
    if (location.isEmpty) {
      sendAlert(Settings.fillLocationMessage, context);
      return;
    }
    fillRequestObject();
    changeScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Settings.backgroundColor,
        body: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Label(
                  text: Settings.location,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 4),
                      border: const OutlineInputBorder(gapPadding: 1),
                      hintText: Settings.enterLocation,
                    ),
                    child: Autocomplete<String>(
                      displayStringForOption: (option) => option,
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return data.locations.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String input) {
                        location = input;
                      },
                    ),
                  ),
                ),
                price,
                bedrooms,
                internalArea,
                saleOrRentSelection,
                ElevatedButton(
                    onPressed: () => apply(context),
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    child: Text(Settings.apply))
              ],
            )),
      ),
    );
  }
}
