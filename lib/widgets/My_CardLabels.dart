import 'package:flutterfirsttest/widgets/Labels.dart';
import 'package:flutterfirsttest/widgets/Confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/db/DataBaseHelper.dart';
import 'dart:async';

class My_CardLabels extends StatefulWidget {
  final VoidCallback? delete;
  final VoidCallback? refresh;
  final Label? label;
  final Proto? proto;
  const My_CardLabels({
    super.key,
    this.proto,
    this.label,
    this.delete,
    this.refresh,
  });
  @override
  State<My_CardLabels> createState() => _My_CardLabelsState();
}

class _My_CardLabelsState extends State<My_CardLabels> {
  Timer? timer;
  DBLabel? dbLabel;
  Confirm c = Confirm();
  bool confirm = true;
  bool light = true;

  static List<int> DayToInt(String days) {
    List<int> DaysInInt = [];

    if (days.contains("Sun")) DaysInInt.add(7);
    if (days.contains("Mon")) DaysInInt.add(1);
    if (days.contains("Tue")) DaysInInt.add(2);
    if (days.contains("Wed")) DaysInInt.add(3);
    if (days.contains("Thu")) DaysInInt.add(4);
    if (days.contains("Fri")) DaysInInt.add(5);
    if (days.contains("Sat")) DaysInInt.add(6);

    return DaysInInt;
  }

  @override
  void initState() {
    super.initState();
    if (widget.proto != null) {
      setState(() {
        dbLabel = DBLabel(
          id: -1,
          medName: widget.proto!.medName,
          alarmTime: widget.proto!.DateAndTimes,
          days: widget.proto!.days,
        );
      });
    } else if (widget.label != null) {
      createLabelInDb();
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        if (_My_CardLabelsState.DayToInt(
              widget.label!.days,
            ).contains(DateTime.now().weekday) &&
            widget.label!.DateAndTimes.hour == DateTime.now().hour &&
            widget.label!.DateAndTimes.minute == DateTime.now().minute &&
            widget.label!.DateAndTimes.second == DateTime.now().second) {
          print("The alarm notice over http worked!");
        }
      });
      print(
        ' Printing the time: ${widget.label!.DateAndTimes} - ${widget.label!.DateAndTimes.hour}:${widget.label!.DateAndTimes.minute}',
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void createLabelInDb() async {
    final db = DataBaseHelper();

    final labels = await db.getLabelsAsObjects();
    final newLabel = labels.firstWhere(
      (label) => label.id == widget.label!.id,
      orElse: () => DBLabel(
        id: widget.label!.id ?? -1,
        medName: widget.label!.medName,
        alarmTime: widget.label!.DateAndTimes,
        days: widget.label!.days,
      ),
    );

    setState(() {
      dbLabel = newLabel;
    });
  }

  Widget chooseTextToOutput(
    String days,
    String medName,
    DateTime dateTime,
    Color textDark,
    Color mutedTextDark,
  ) {
    final normalized = days.trim();
    final lower = normalized.toLowerCase();
    String displayDays = normalized;
    if (lower.contains("everyday")) {
      displayDays = "Everyday";
    } else if (lower.contains("weekdays")) {
      displayDays = "Weekdays";
    } else if (lower.contains("weekends")) {
      displayDays = "Weekends";
    } else {
      final tokens = normalized
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .map((s) => s.toLowerCase())
          .toSet();
      const allDays = {'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'};
      const weekDays = {'sun', 'mon', 'tue', 'wed', 'thu'};
      const weekEnds = {'fri', 'sat'};
      if (tokens.length == allDays.length && tokens.containsAll(allDays)) {
        displayDays = "Everyday";
      } else if (tokens.length == weekDays.length &&
          tokens.containsAll(weekDays)) {
        displayDays = "Weekdays";
      } else if (tokens.length == weekEnds.length &&
          tokens.containsAll(weekEnds)) {
        displayDays = "Weekends";
      }
    }
    if (displayDays.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            medName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Saira",
              fontSize: 20,
              color: textDark,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          MediaQuery.of(context).size.width < 600
              ? SizedBox(height: 1)
              : SizedBox(height: 5),
          Text(
            displayDays,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Saira",
              fontSize: 14,
              color: textDark,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            medName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Saira",
              fontSize: 20,
              color: textDark,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Saira",
              fontSize: 14,
              color: textDark,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      );
    }
  }

  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final textDark = light
        ? themeColor.hsl_textDark.toColor()
        : HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.5).toColor();
    final MutedTextDark = light
        ? themeColor.hsl_MutedTextDark.toColor()
        : HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.5).toColor();
    if (dbLabel == null) {
      return SizedBox.shrink();
    }
    final medName = dbLabel!.medName;
    final dateTime = dbLabel!.alarmTime;
    final days = dbLabel!.days;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 7, 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  bool? confirm = await c.showConfirmBox(context);
                  if (confirm == true) {
                    widget.delete?.call();
                  }
                },
                icon: Icon(Icons.delete, size: 30),
              ),
            ],
          ),
        ),
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => _hover = true),
            onExit: (_) => setState(() => _hover = false),
            child: Card(
              color: themeColor.hsl_CardColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: _hover
                      ? themeColor.hsl_highlightedBorderCardDark
                      : themeColor.hsl_BorderCardDark,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.grey[700],
              elevation: _hover ? 1 : 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 90),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      transform: MediaQuery.of(context).size.width > 600
                          ? GradientRotation(45 * 3.14 / 180)
                          : GradientRotation(45 * 3.14 / 79),
                      colors: [
                        themeColor.hsl_layoutDark1.toColor(),
                        themeColor.hsl_LabelDark2.toColor(),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Saira",
                              fontSize: 24,
                              color: textDark,
                              letterSpacing: 2.0,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: VerticalDivider(
                          width: 1,
                          color: MutedTextDark,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: chooseTextToOutput(
                            days,
                            medName,
                            dateTime,
                            textDark,
                            MutedTextDark,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Switch(
                          mouseCursor: SystemMouseCursors.click,
                          padding: EdgeInsets.all(5),
                          value: light,
                          activeThumbColor: HSLColor.fromAHSL(
                            1.0,
                            221.21,
                            0.83,
                            0.53,
                          ).toColor(),
                          inactiveThumbColor: const Color.fromARGB(
                            255,
                            35,
                            41,
                            43,
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
