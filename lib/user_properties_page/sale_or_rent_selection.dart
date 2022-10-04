import "package:flutter/material.dart";
import '../widgets/label.dart';
import '../widgets/frame.dart';
import '../settings.dart';

enum PublishType { sale, rent }

class SaleOrRentSelection extends StatefulWidget {
  SaleOrRentSelection({Key? key}) : super(key: key);
  PublishType? publishType = PublishType.sale;
  @override
  State<SaleOrRentSelection> createState() => _SaleOrRentSelectionState();
}

class _SaleOrRentSelectionState extends State<SaleOrRentSelection> {
  @override
  Widget build(BuildContext context) {
    return Frame(
        child: Row(
      children: [
        Label(
          text: Settings.sale,
          child: Radio<PublishType>(
              value: PublishType.sale,
              groupValue: widget.publishType,
              onChanged: (PublishType? value) {
                setState(() {
                  widget.publishType = value;
                });
              }),
        ),
        Label(
            text: Settings.rent,
            child: Radio<PublishType>(
                value: PublishType.rent,
                groupValue: widget.publishType,
                onChanged: (PublishType? value) {
                  setState(() {
                    widget.publishType = value;
                  });
                }))
      ],
    ));
  }
}
