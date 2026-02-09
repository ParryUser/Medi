import 'package:flutter/material.dart';

class Options {
  final String text;
  final Widget icon;
  final Widget selectedIcon;

  const Options(this.text, this.icon, this.selectedIcon);
}

List<Options> options = <Options>[
  Options('Home',
     Icon(Icons.widgets_outlined),
     Icon(Icons.widgets)),
  Options(
    'Analytics',
    Icon(Icons.monitor_heart_outlined),
    Icon(Icons.monitor_heart),
  ),
  Options(
    'Medical Information',
    Icon(Icons.medical_information_outlined),
    Icon(Icons.medical_information),
  ),
];
