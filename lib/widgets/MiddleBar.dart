import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';

class MiddleBar extends StatelessWidget {
  final void Function(bool ascending) ChangeLabelsOrder;
  static bool? hide;
  MiddleBar({super.key, required this.ChangeLabelsOrder});
  final List<String> options = <String>["Default view", "Box view", "hide"];
  late String? selectedOption = options.first;

  bool please(bool value) => value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: themeColor.hsl_LabelDark2.toColor(),
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  themeColor.hsl_layoutDark1.toColor(),
                  themeColor.hsl_LabelDark2.toColor(),
                  themeColor.hsl_buttonDark3.toColor(),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3, 1.0],
                transform: GradientRotation(45 * 3.14 / 180),
              ),
            ),
            child: DropdownButton(
              elevation: 0,
              padding: EdgeInsets.all(5),
              dropdownColor: themeColor.hsl_buttonDark3.toColor(),
              focusColor: themeColor.hsl_buttonDark3.toColor(),
              underline: Container(color: themeColor.hsl_bgDark, height: 0),
              alignment: AlignmentDirectional.centerStart,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Sora",
                color: themeColor.hsl_MutedTextDark.toColor(),
              ),
              value: selectedOption,
              items: options
                  .map<DropdownMenuItem<String>>(
                    (String option) =>
                    DropdownMenuItem(value: option, child: Text(option)),
              )
                  .toList(),
              onChanged: (String? newOption) {
                selectedOption = newOption!;
                if (selectedOption == "hide") {
                  MiddleBar.hide = true;
                } else {
                  MiddleBar.hide = false;
                }
                // trigger a refresh without changing sort order; keep current order
                // Home will handle actual sorting when arrows are pressed
                ChangeLabelsOrder.call(true);
              },
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: IconButton(
                  iconSize: 16,
                  padding: EdgeInsets.all(4),
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                  icon: Icon(
                    Icons.arrow_upward,
                    color: themeColor.hsl_MutedTextDark.toColor(),
                  ),
                  onPressed: () {
                    // Delegate sort to Home for both prototypes and labels
                    ChangeLabelsOrder.call(true);
                  },
                ),
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  width: 6,
                  thickness: 1,
                  color: themeColor.hsl_MutedTextDark.toColor(),
                ),
              ),
              Flexible(
                child: IconButton(
                  iconSize: 16,
                  padding: EdgeInsets.all(4),
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                  icon: Icon(
                    Icons.arrow_downward,
                    color: themeColor.hsl_MutedTextDark.toColor(),
                  ),
                  onPressed: () {
                    // Delegate sort to Home for both prototypes and labels
                    ChangeLabelsOrder.call(false);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}