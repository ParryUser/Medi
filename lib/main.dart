import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/Loading.dart';
import 'package:flutterfirsttest/widgets/Home.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/MedicalInfo.dart';
import 'package:flutterfirsttest/widgets/MedAnalysis.dart';
import 'package:flutterfirsttest/db/DataBaseHelper.dart';
import 'package:flutterfirsttest/widgets/Labels.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print("main");

  final db = DataBaseHelper();

  if (kIsWeb) {
    print("cool");
  } else {
    final prefs = await SharedPreferences.getInstance();
    final seeded = prefs.getBool('prototypes_seeded') ?? false;
    if (!seeded) {
      final existing = await db.getLabelsAsObjects();
      if (existing.isEmpty) {
        await Labels().addPrototypes();
      }
      await prefs.setBool('prototypes_seeded', true);
    }
  }

  final dbLabels = await db.getLabelsAsObjects();
  Labels.cardInfo = dbLabels
      .map(
        (dbLabel) => Label(
          id: dbLabel.id,
          dateAndTimes: dbLabel.alarmTime,
          medNameParam: dbLabel.medName,
          days: dbLabel.days,
        ),
      )
      .toList();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: themeColor.hsl_bgDark,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 16,
            fontFamily: "Sora",
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
          bodyMedium: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 18,
            fontFamily: "Sora",
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
          bodyLarge: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 20,
            fontFamily: "Sora",
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: themeColor.hsl_buttonDark3.toColor(),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: themeColor.hsl_bgDark,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 16,
            fontFamily: "Sora",
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
          bodyMedium: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 18,
            fontFamily: "Sora",
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
          bodyLarge: TextStyle(
            color: themeColor.hsl_textDark.toColor(),
            fontSize: 20,
            fontFamily: "Sora",
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: themeColor.hsl_buttonDark3.toColor(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/first': (context) => Home(),
        '/MedicalInfo': (context) => Medical(),
        '/Analysis': (context) => Analysis(),
      },
    );
  }
}
