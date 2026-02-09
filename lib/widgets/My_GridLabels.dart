import 'package:flutterfirsttest/widgets/Labels.dart';
import 'package:flutterfirsttest/widgets/Confirm.dart';
import 'package:flutter/material.dart';

class My_GridLabels extends StatefulWidget {
  final String medDate;
  final VoidCallback delete;
  const My_GridLabels({super.key, required this.medDate, required this.delete});

  @override
  State<My_GridLabels> createState() => _My_GridLabelsState();
}

class _My_GridLabelsState extends State<My_GridLabels> {
  Confirm c = Confirm();
  bool confirm = true;
  late List<Labels> labels;
  bool light = true;
  var hsl_bgDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.0);
  var hsl_buttonDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.1);
  var hsl_LabelDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.2);
  var hsl_textDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.9);
  var hsl_MutedTextDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.65);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 11,
      crossAxisSpacing: 11,
      childAspectRatio: 0.8,
      children: labels.map((label) => createGrids(label)).toList(),
    );
  }

  Widget createGrids(Labels label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  bool? confirm = await c.showConfirmBox(context);
                  if (confirm == true) {
                    widget.delete.call();
                    labels.remove(label);
                  }
                },
                icon: Icon(Icons.delete, size: 30),
              ),
            ],
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: hsl_LabelDark.toColor(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '$label',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Saira",
                        fontSize: 18,
                        color: hsl_textDark.toColor(),
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    width: 5,
                    color: hsl_MutedTextDark.toColor(),
                    thickness: 1,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      widget.medDate,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Saira",
                        fontSize: 16,
                        color: hsl_MutedTextDark.toColor(),
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Switch(
                  padding: EdgeInsets.all(15),
                  value: light,
                  activeThumbColor: Colors.deepPurple,
                  inactiveThumbColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
