import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterfirsttest/widgets/Labels.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper._internal();
  static Database? _database;

  DataBaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  factory DataBaseHelper() {
    return _instance;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'main.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE labels(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            med_name TEXT NOT NULL,
            alarm_time INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE labels_days(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            label_id INTEGER NOT NULL,
            days TEXT NOT NULL,
            CONSTRAINT fk_label
            FOREIGN KEY (label_id)
            REFERENCES labels(id)
          )
       ''');
      },
    );
  }

  Future<int> createLabel({
    required String med_name,
    required int alarm_time,
    required String days,
  }) async {
    final db = await database;

    return await db.transaction((txn) async {
      int labelId = await txn.insert('labels', {
        'med_name': med_name,
        'alarm_time': alarm_time,
      });
      await txn.insert('labels_days', {'label_id': labelId, 'days': days});
      return labelId;
    });
  }

  Future<void> deleteLabel(int id) async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.delete('labels_days', where: 'label_id = ?', whereArgs: [id]);
      await txn.delete('labels', where: 'id = ?', whereArgs: [id]);
    });
  }

  Future<List<Map<String, dynamic>>> getLabels() async {
    final db = await database;

    final labels = await db.query('labels');
    for (var label in labels) {
      final days = await db.query(
        'labels_days',
        where: 'label_id = ?',
        whereArgs: [label['id']],
      );
      label['days'] = days.map((day) => day['days']).toList();
    }
    return labels;
  }

  Future<List<DBLabel>> getLabelsAsObjects() async {
    final db = await database;

    final labelsData = await db.query('labels');
    List<DBLabel> labels = [];

    for (var data in labelsData) {
      final daysResult = await db.query(
        'labels_days',
        where: 'label_id = ?',
        whereArgs: [data['id']],
      );

      String days = daysResult.map((d) => d['days'] as String).join(", ");

      labels.add(DBLabel.fromMap(data, days: days));
    }

    return labels;
  }
}
