import 'package:flutterfirsttest/db/DataBaseHelper.dart';

class Labels {
  static List<Label> cardInfo = [];
  bool hide = false;

  Future<void> addPrototypes() async {
    final db = DataBaseHelper();

    for (var proto in cool.cardInfo) {
      await db.createLabel(
        med_name: proto.medName,
        alarm_time: proto.DateAndTimes.millisecondsSinceEpoch,
        days: proto.days,
      );
    }
  }
}

class cool {
  static final DateTime a = DateTime(2026, 1, 30, 9, 30);
  static final DateTime b = DateTime(2026, 3, 5, 13, 15);
  static final DateTime c = DateTime(2026, 5, 17, 19, 00);
  static final DateTime d = DateTime(2026, 7, 1, 21, 45);

  static List<Proto> cardInfo = [
    Proto(DateAndTimes: a, medName: "Panadol", days: "Sun, Mon, Tue, Wed, Thu"),
    Proto(DateAndTimes: b, medName: "Albuterol", days: "Sun, Tue, Sat"),
    Proto(DateAndTimes: c, medName: "Enalapril", days: "Wed, Thu, Fri"),
    Proto(DateAndTimes: d, medName: "Aspirin", days: "Fri, Sat"),
  ];
  bool hide = false;
}

class Proto {
  final DateTime DateAndTimes;
  final String medName;
  final String days;
  Proto({
    required this.DateAndTimes,
    required this.medName,
    required this.days,
  });
}

class Label {
  int? id;
  DateTime DateAndTimes;
  String medName;
  String days;
  Label({this.id, DateTime? dateAndTimes, String? medNameParam, this.days = ""})
    : DateAndTimes = dateAndTimes ?? DateTime.now(),
      medName = medNameParam ?? "";
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'med_name': medName,
      'alarm_time': DateAndTimes.millisecondsSinceEpoch,
      'days': days,
    };
  }

  factory Label.fromMap(Map<String, dynamic> map) {
    return Label(
      id: map['id'],
      medNameParam: map['med_name'],
      dateAndTimes: DateTime.fromMillisecondsSinceEpoch(map['alarm_time']),
      days: map['days'] ?? "",
    );
  }
}

class DBLabel {
  final int id;
  final String medName;
  final DateTime alarmTime;
  final String days;
  DBLabel({
    required this.id,
    required this.medName,
    required this.alarmTime,
    required this.days,
  });
  factory DBLabel.fromMap(Map<String, dynamic> map, {String? days}) {
    return DBLabel(
      id: map['id'],
      medName: map['med_name'],
      alarmTime: DateTime.fromMillisecondsSinceEpoch(map['alarm_time']),
      days: days ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'med_name': medName,
      'alarm_time': alarmTime.millisecondsSinceEpoch,
      'days': days,
    };
  }
}
