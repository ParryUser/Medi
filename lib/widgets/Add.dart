import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Labels.dart';
import 'package:flutterfirsttest/db/DataBaseHelper.dart';
import 'package:flutter/foundation.dart';

String Days = "";

enum DaysOfWeek {
  Sunday(DateTime.sunday, "Sun"),
  Monday(DateTime.monday, "Mon"),
  Tuesday(DateTime.tuesday, "Tue"),
  Wednesday(DateTime.wednesday, "Wed"),
  Thursday(DateTime.thursday, "Thu"),
  Friday(DateTime.friday, "Fri"),
  Saturday(DateTime.saturday, "Sat");

  final int dayValue;
  final String dayName;
  const DaysOfWeek(this.dayValue, this.dayName);
}

const List<(DaysOfWeek, String)> dayList = <(DaysOfWeek, String)>[
  (DaysOfWeek.Sunday, "S"),
  (DaysOfWeek.Monday, "M"),
  (DaysOfWeek.Tuesday, "T"),
  (DaysOfWeek.Wednesday, "W"),
  (DaysOfWeek.Thursday, "T"),
  (DaysOfWeek.Friday, "F"),
  (DaysOfWeek.Saturday, "S"),
];
const List<(DaysOfWeek, String)> dayListWindows = <(DaysOfWeek, String)>[
  (DaysOfWeek.Sunday, "Sun"),
  (DaysOfWeek.Monday, "Mon"),
  (DaysOfWeek.Tuesday, "Tue"),
  (DaysOfWeek.Wednesday, "Wed"),
  (DaysOfWeek.Thursday, "Thu"),
  (DaysOfWeek.Friday, "Fri"),
  (DaysOfWeek.Saturday, "Sat"),
];
Set<DaysOfWeek> selectedDays = <DaysOfWeek>{DaysOfWeek.Friday};

// Prevent duplicate entries and persist to DB on non-web platforms
Future<void> _addLabelSafely(Label newLabel) async {
  // Persist to DB when supported
  if (!kIsWeb) {
    final db = DataBaseHelper();
    final id = await db.createLabel(
      med_name: newLabel.medName,
      alarm_time: newLabel.DateAndTimes.millisecondsSinceEpoch,
      days: newLabel.days,
    );
    newLabel.id = id;
  }

  // Deduplicate: same medName, exact DateTime, and same days
  final exists = Labels.cardInfo.any(
    (l) =>
        l.medName == newLabel.medName &&
        l.days == newLabel.days &&
        l.DateAndTimes.isAtSameMomentAs(newLabel.DateAndTimes),
  );

  if (!exists) {
    Labels.cardInfo.add(newLabel);
    Labels.cardInfo.sort((a, b) => a.DateAndTimes.compareTo(b.DateAndTimes));
  }
}

class SegButtons extends StatefulWidget {
  const SegButtons({super.key});

  @override
  State<SegButtons> createState() => _SegButtonsState();
}

class _SegButtonsState extends State<SegButtons> {
  @override
  Widget build(BuildContext context) {
    return RadioDaysOfWeek(context);
  }

  Widget RadioDaysOfWeek(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: MediaQuery.of(context).size.width < 600 ? 5.0 : 30.0,
          runSpacing: MediaQuery.of(context).size.width < 600 ? 5.0 : 30.0,
          children: MediaQuery.of(context).size.width < 600
              ? dayList.map<Widget>(((DaysOfWeek, String) day) {
                  bool isSelected = selectedDays.contains(day.$1);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(day.$1);
                        } else {
                          selectedDays.add(day.$1);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? themeColor.hsl_calendarDark.toColor()
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? themeColor.hsl_calendarDark.toColor()
                              : themeColor.hsl_MutedTextDark.toColor(),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        day.$2,
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: themeColor.hsl_textDark.toColor(),
                        ),
                      ),
                    ),
                  );
                }).toList()
              : dayListWindows.map<Widget>(((DaysOfWeek, String) day) {
                  bool isSelected = selectedDays.contains(day.$1);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(day.$1);
                        } else {
                          selectedDays.add(day.$1);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? themeColor.hsl_calendarDark.toColor()
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? themeColor.hsl_calendarDark.toColor()
                              : themeColor.hsl_MutedTextDark.toColor(),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        day.$2,
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: themeColor.hsl_textDark.toColor(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
        ),
      ],
    );
  }
}

Future<void> addMedicine(BuildContext context) async {
  DateTime? combinedDateTime;

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
    initialEntryMode: DatePickerEntryMode.calendar,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: themeColor.hsl_calendarDark.toColor(),
            onPrimary: themeColor.hsl_MutedTextDark.toColor(),
            surface: themeColor.hsl_layoutDark1.toColor(),
            onSurface: themeColor.hsl_textDark.toColor(),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: themeColor.hsl_calendarDark.toColor(),
                onPrimary: themeColor.hsl_MutedTextDark.toColor(),
                surface: themeColor.hsl_layoutDark1.toColor(),
                onSurface: themeColor.hsl_textDark.toColor(),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (pickedTime != null) {
      DateTime combinedDateTimeList = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      combinedDateTime = combinedDateTimeList;

      TextEditingController controller = TextEditingController();
      String? pickedMedName = await showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Enter The Medicine Name",
              style: TextStyle(
                color: themeColor.hsl_textDark.toColor(),
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.5,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            backgroundColor: themeColor.hsl_layoutDark1.toColor(),
            content: TextField(
              controller: controller,
              autofocus: true,
              style: TextStyle(
                color: themeColor.hsl_textDark.toColor(),
                fontFamily: "Sora",
              ),
              decoration: InputDecoration(
                hintText: "Medicine Name",
                hintStyle: TextStyle(
                  color: themeColor.hsl_MutedTextDark.toColor(),
                  fontFamily: "Sora",
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeColor.hsl_MutedTextDark.toColor(),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeColor.hsl_textDark.toColor(),
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontFamily: "Saira",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Navigator.pop(context, controller.text);
                  }
                },
              ),
              OutlinedButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: "Saira",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, null);
                },
              ),
            ],
          );
        },
      );
      if (pickedMedName != null && pickedMedName.isNotEmpty) {
        Label newLabel = Label(
          dateAndTimes: combinedDateTime,
          medNameParam: pickedMedName,
          days: Days,
        );

        await _addLabelSafely(newLabel);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Medicine Alarm For $pickedMedName Was Added Successfully!',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Medicine name cannot be empty')),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a time')));
    }
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please select a date')));
  }
}

Future<void> addTimer(
  BuildContext context, {
  VoidCallback? onMedicineAdded,
}) async {
  final Set<DaysOfWeek> savedDays = Set<DaysOfWeek>.from(selectedDays);
  final List<String> dayName = savedDays.map((day) => day.dayName).toList();
  String chosenDays = dayName.join(", ");
  Days = chosenDays;
  DateTime combinedDateTime;

  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: themeColor.hsl_calendarDark.toColor(),
              onPrimary: themeColor.hsl_MutedTextDark.toColor(),
              surface: themeColor.hsl_layoutDark1.toColor(),
              onSurface: themeColor.hsl_textDark.toColor(),
            ),
          ),
          child: child!,
        ),
      );
    },
  );

  if (pickedTime != null) {
    DateTime now = DateTime.now();
    DateTime combinedDateTimeList = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );
    combinedDateTime = combinedDateTimeList;
    TextEditingController controller = TextEditingController();
    String? pickedMedName = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Enter The Medicine Name",
            style: TextStyle(
              color: themeColor.hsl_textDark.toColor(),
              fontFamily: "Sora",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          backgroundColor: themeColor.hsl_layoutDark1.toColor(),
          content: TextField(
            controller: controller,
            autofocus: true,
            style: TextStyle(
              color: themeColor.hsl_textDark.toColor(),
              fontFamily: "Sora",
            ),
            decoration: InputDecoration(
              hintText: "Medicine Name",
              hintStyle: TextStyle(
                color: themeColor.hsl_MutedTextDark.toColor(),
                fontFamily: "Sora",
                fontSize: 16,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: themeColor.hsl_MutedTextDark.toColor(),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: themeColor.hsl_textDark.toColor(),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontFamily: "Saira",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.pop(context, controller.text);
                }
              },
            ),
            OutlinedButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: "Saira",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, null);
              },
            ),
          ],
        );
      },
    );

    if (pickedMedName != null && pickedMedName.isNotEmpty) {
      Label newLabel = Label(
        dateAndTimes: combinedDateTime,
        medNameParam: pickedMedName,
        days: chosenDays,
      );

      await _addLabelSafely(newLabel);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medicine "$pickedMedName" added successfully!'),
        ),
      );
      // Call the callback to refresh the Home screen
      onMedicineAdded?.call();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medicine name cannot be empty')),
      );
    }
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please select a time')));
  }
}
