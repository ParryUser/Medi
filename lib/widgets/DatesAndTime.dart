import 'package:flutter/material.dart';

class Datesandtime {
  Future<void> chooseTime(BuildContext context) async {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please select a date first')));
    return;
  }
}
