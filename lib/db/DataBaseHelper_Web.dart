import 'package:flutterfirsttest/widgets/Labels.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper._internal();

  DataBaseHelper._internal();
  factory DataBaseHelper() => _instance;

  Future<List<DBLabel>> getLabelsAsObjects() async {
    return [];
  }

  Future<int> createLabel({
    required String med_name,
    required int alarm_time,
    required String days,
  }) async {
    throw UnsupportedError('Database not supported on Web');
  }

  Future<void> deleteLabel(int id) async {
    throw UnsupportedError('Database not supported on Web');
  }
}