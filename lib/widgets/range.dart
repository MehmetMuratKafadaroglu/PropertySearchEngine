import "package:flutter/material.dart";
import './label.dart';
import './frame.dart';
import '../settings.dart';

class Range extends StatefulWidget {
  Range({Key? key, required this.end, required this.unit, required this.title})
      : super(key: key);
  final int end, unit;
  int _max = 0, _min = 0;
  get max => _max * unit;
  get min => _min * unit;
  final String title;
  @override
  State<Range> createState() => _RangeState();
}

class _RangeState extends State<Range> {
  @override
  Widget build(BuildContext context) {
    var list = [for (var i = 0; i <= widget.end; i++) i];
    widget._max = widget.end;
    widget._min = 0;
    return Frame(
        child: Label(
            text: widget.title,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Label(
                    text: Settings.min,
                    child: RangeDropDownButton(
                        list: list,
                        val: widget._min,
                        unit: widget.unit,
                        onchange: (dynamic val) {
                          setState(() {
                            widget._min = val;
                          });
                        })),
                Label(
                    text: Settings.max,
                    child: RangeDropDownButton(
                      list: list,
                      val: widget._max,
                      unit: widget.unit,
                      onchange: (dynamic val) {
                        setState(() {
                          widget._max = val;
                        });
                      },
                    ))
              ],
            )));
  }
}

class RangeDropDownButton extends StatefulWidget {
  RangeDropDownButton(
      {Key? key,
      required this.list,
      required this.val,
      required this.unit,
      required this.onchange})
      : super(key: key);
  final List<int> list;
  final int unit;
  final void Function(dynamic) onchange;
  int val;

  @override
  State<RangeDropDownButton> createState() => _RangeDropDownButtonState();
  String formatInt(int number) {
    String asStr = number.toString();
    String result = "";
    if (asStr.length <= 3) return asStr;
    int i = 0, j = 0;
    while (i < asStr.length) {
      if (j == 3) {
        result += ",";
        j = -1;
      } else {
        result += asStr[i];
        i++;
      }
      j++;
    }
    return result;
  }
}

class _RangeDropDownButtonState extends State<RangeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> items = widget.list.map((int n) {
      return DropdownMenuItem<int>(
        value: n,
        child: Text(widget.formatInt(n * widget.unit)),
      );
    }).toList();
    return DropdownButton(
        value: widget.val,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        items: items,
        onChanged: widget.onchange);
  }
}
