import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Options.dart';
import 'package:flutterfirsttest/widgets/Home.dart';
import 'package:flutterfirsttest/widgets/Charts.dart';
import 'package:flutterfirsttest/widgets/Labels.dart';
import 'dart:math';

Widget header(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Sora",
      letterSpacing: 2.0,
    ),
  );
}

Widget subHeader(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "Sora",
      letterSpacing: 1.5,
    ),
  );
}

Widget bold(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Sora",
      letterSpacing: 2.0,
    ),
  );
}

Widget normal(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: "Sora",
      letterSpacing: 1.5,
    ),
  );
}

Widget muted(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: "Sora",
      letterSpacing: 1.5,
    ),
  );
}

Widget nearlyMuted(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: "Sora",
      letterSpacing: 1.5,
    ),
  );
}

class medCard {
  static List<card0> cards = [];
}

class Analysis extends StatefulWidget {
  const Analysis({super.key});
  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String getDosage(String medName) {
    if (medName == "Panadol") {
      return "As You Deem Fit (Don't Exceed 4g/day)";
    } else if (medName == "Aspirin") {
      return "325-650 mg every 4-6 hours";
    } else if (medName == "Albuterol") {
      return "2.5 mg every 4-6 hours as needed";
    } else if (medName == "Enalapril") {
      return "5-20 mg - Once Daily";
    } else if (medName == "Lisinopril") {
      return "10-40 mg - Once daily";
    } else {
      return "Data Not Available (Consult a healthcare professional for dosage)";
    }
  }

  List<Widget> medCards() {
    return Labels.cardInfo.asMap().entries.map((entry) {
      var cardInfo = entry.value;

      return card0(
        name: cardInfo.medName.isNotEmpty
            ? cardInfo.medName
            : "Unknown Medication",
        label: percent,
        dosage: getDosage(cardInfo.medName),
      );
    }).toList();
  }

  final int percent = 70 + Random().nextInt(31);

  @override
  Widget build(BuildContext context) {
    if (Home.light == true) {
      themeColor.hsl_bgDark = HSLColor.fromAHSL(
        1.0,
        210.0,
        0.2,
        0.98,
      ).toColor();
      themeColor.hsl_layoutDark1 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.9);
      themeColor.hsl_buttonDark3 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.7);
      themeColor.hsl_LabelDark2 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.8);
      themeColor.hsl_textDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.1);
      themeColor.hsl_nearlyMutedTextDark = HSLColor.fromAHSL(
        1.0,
        0.0,
        0.0,
        0.25,
      );
      themeColor.hsl_MutedTextDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.35);
      themeColor.hsl_BorderCardDark = themeColor.gray200;
      themeColor.hsl_highlightedBorderCardDark = themeColor.gray300;
      themeColor.hsl_CardColorDark = Color(0xFFFFFFFF);
    } else {
      themeColor.hsl_bgDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.0).toColor();
      themeColor.hsl_layoutDark1 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.1);
      themeColor.hsl_buttonDark3 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.3);
      themeColor.hsl_LabelDark2 = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.2);
      themeColor.hsl_textDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.9);
      themeColor.hsl_nearlyMutedTextDark = HSLColor.fromAHSL(
        1.0,
        0.0,
        0.0,
        0.75,
      );
      themeColor.hsl_MutedTextDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.65);
      themeColor.hsl_CardColorDark = themeColor.zinc900;
      themeColor.hsl_BorderCardDark = themeColor.zinc800;
      themeColor.hsl_highlightedBorderCardDark = themeColor.zinc700;
    }
    return Scaffold(
      backgroundColor: themeColor.hsl_bgDark,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: themeColor.hsl_LabelDark2
                .toColor(), //buttons ok / cancel / circle fill in
            onPrimary: themeColor.hsl_MutedTextDark.toColor(), //circle
            surface: themeColor.hsl_layoutDark1.toColor(),
            onSurface: themeColor.hsl_textDark.toColor(), //text
          ),
          navigationDrawerTheme: NavigationDrawerThemeData(
            backgroundColor: themeColor.hsl_layoutDark1.toColor(),
            surfaceTintColor: Colors.transparent,
            indicatorColor: themeColor.hsl_LabelDark2.toColor(),
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: NavigationDrawer(
          onDestinationSelected: (int index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/first');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, '/Analysis');
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, '/MedicalInfo');
            }
          },
          selectedIndex: 1,
          children: [
            ListTile(
              autofocus: true,
              selectedColor: themeColor.hsl_textDark.toColor(),
              selectedTileColor: themeColor.hsl_layoutDark1.toColor(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Menu Options",
                style: TextStyle(
                  color: themeColor.hsl_textDark.toColor(),
                  fontFamily: "Sora",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            ...options.map((option) {
              return NavigationDrawerDestination(
                icon: option.icon,
                label: Text(
                  option.text,
                  style: TextStyle(
                    color: themeColor.hsl_textDark.toColor(),
                    fontFamily: "Sora",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                selectedIcon: option.selectedIcon,
              );
            }),
            Padding(padding: EdgeInsets.all(15.0), child: Divider()),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.fromLTRB(10, 10, 15, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.hsl_LabelDark2.toColor(),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(45 * 3.141592653589793 / 180),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() => Home.light = !Home.light);
                    },
                    icon: Icon(Icons.health_and_safety_outlined, size: 30),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(
                          Icons.menu_outlined,
                          size: 30,
                          color: themeColor.hsl_textDark.toColor(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: themeColor.hsl_bgDark,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorColor: themeColor.hsl_textDark.toColor(),
                labelColor: themeColor.hsl_textDark.toColor(),
                unselectedLabelColor: themeColor.hsl_MutedTextDark.toColor(),
                tabs: [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.bar_chart),
                          SizedBox(width: 6),
                          Text("Overview"),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle:
                                -45 *
                                3.141592653589793 /
                                180, // 45 degrees in radians
                            child: Icon(Icons.link_outlined),
                          ),
                          SizedBox(width: 6),
                          Text("Medications"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30, top: 30),
                      child: Column(
                        children: [
                          MediaQuery.of(context).size.width < 600
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        stuff1(
                                          "Adherence Rate",
                                          "92%",
                                          "Last 30 Days",
                                          Home.light
                                              ? themeColor.blue600
                                              : themeColor.blue400,
                                          Icons.medical_services_outlined,
                                          Home.light
                                              ? Color(0xFFEFF6FF)
                                              : themeColor.blue600.withOpacity(
                                                  0.2,
                                                ),
                                          true,
                                          "5%",
                                        ),
                                        SizedBox(width: 15),
                                        stuff1(
                                          "Days On Treatment",
                                          "4 Weeks",
                                          "Since Jan 2026",
                                          Home.light
                                              ? themeColor.blue600
                                              : themeColor.blue400,
                                          Icons.calendar_month_outlined,
                                          Home.light
                                              ? Color(0xFFEFF6FF)
                                              : themeColor.blue600.withOpacity(
                                                  0.2,
                                                ),
                                          false,
                                          "",
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        stuff1(
                                          "Treatment Goals",
                                          "3/5",
                                          "Goals Achieved",
                                          Home.light
                                              ? themeColor.blue600
                                              : themeColor.blue400,
                                          Icons.track_changes_outlined,
                                          Home.light
                                              ? Color(0xFFEFF6FF)
                                              : themeColor.blue600.withOpacity(
                                                  0.2,
                                                ),
                                          true,
                                          "60%",
                                        ),
                                        SizedBox(width: 15),

                                        stuff1(
                                          "Side Effects",
                                          "Mild",
                                          "Deacreasing Trend",
                                          Home.light
                                              ? themeColor.blue600
                                              : themeColor.blue400,
                                          Icons.error_outline_outlined,
                                          Home.light
                                              ? Color(0xFFEFF6FF)
                                              : themeColor.blue600.withOpacity(
                                                  0.2,
                                                ),
                                          false,
                                          "",
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Wrap(
                                  children: [
                                    stuff1(
                                      "Adherence Rate",
                                      "92%",
                                      "Last 30 Days",
                                      Home.light
                                          ? themeColor.blue600
                                          : themeColor.blue400,
                                      Icons.medical_services_outlined,
                                      Home.light
                                          ? Color(0xFFEFF6FF)
                                          : themeColor.blue600.withOpacity(0.2),
                                      true,
                                      "5%",
                                    ),
                                    SizedBox(width: 15),
                                    stuff1(
                                      "Days On Treatment",
                                      "4 Weeks",
                                      "Since Jan 2026",
                                      Home.light
                                          ? themeColor.blue600
                                          : themeColor.blue400,
                                      Icons.calendar_month_outlined,
                                      Home.light
                                          ? Color(0xFFEFF6FF)
                                          : themeColor.blue600.withOpacity(0.2),
                                      false,
                                      "",
                                    ),
                                    SizedBox(width: 15),
                                    stuff1(
                                      "Treatment Goals",
                                      "3/5",
                                      "Goals Achieved",
                                      Home.light
                                          ? themeColor.blue600
                                          : themeColor.blue400,
                                      Icons.track_changes_outlined,
                                      Home.light
                                          ? Color(0xFFEFF6FF)
                                          : themeColor.blue600.withOpacity(0.2),
                                      true,
                                      "60%",
                                    ),
                                    SizedBox(width: 15),

                                    stuff1(
                                      "Side Effects",
                                      "Mild",
                                      "Deacreasing Trend",
                                      Home.light
                                          ? themeColor.blue600
                                          : themeColor.blue400,
                                      Icons.error_outline_outlined,
                                      Home.light
                                          ? Color(0xFFEFF6FF)
                                          : themeColor.blue600.withOpacity(0.2),
                                      false,
                                      "",
                                    ),
                                  ],
                                ),
                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 11, right: 11),
                            child: Wrap(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      barChart(
                                        MediaQuery.of(context).size.width < 600
                                            ? MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.90
                                            : MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.47,
                                        400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 30),
                                pieChart(
                                  MediaQuery.of(context).size.width < 600
                                      ? MediaQuery.of(context).size.width * 0.90
                                      : MediaQuery.of(context).size.width *
                                            0.47,
                                  400,
                                  Home.light
                                      ? themeColor.blue600
                                      : themeColor.blue600,
                                  Home.light
                                      ? themeColor.green600
                                      : Color(0xFFEF4444),
                                  Home.light
                                      ? themeColor.purple600
                                      : themeColor.purple600,
                                  Home.light
                                      ? Color(0xFFEF4444)
                                      : themeColor.green600,
                                  75,
                                  3,
                                  10,
                                  12,
                                  90,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: themeColor.hsl_bgDark,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: themeColor.hsl_BorderCardDark,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, top: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      header(
                                        "Current Medications",
                                        themeColor.hsl_textDark.toColor(),
                                      ),
                                    ],
                                  ),
                                ),
                                card0(
                                  dosage:
                                      '500-1,000 mg every 4-6 hours as needed',
                                  name: 'Panadol',
                                  label: 95,
                                ),
                                card0(
                                  dosage: '10mg - Once Daily',
                                  name: 'Loratadine',
                                  label: 75,
                                ),
                                card0(
                                  dosage: '325-650 mg every 4-6 hours',
                                  name: 'Aspirin',
                                  label: 45,
                                ),
                                ...medCards(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget stuff1(
  String title,
  String description,
  String description1st,
  Color color,
  IconData icon,
  Color bgColor,
  bool box,
  String percent,
) {
  return HoverableStuff1Card(
    title: title,
    description: description,
    description1st: description1st,
    color: color,
    icon: icon,
    bgColor: bgColor,
    box: box,
    percent: percent,
  );
}

class HoverableStuff1Card extends StatefulWidget {
  final String title;
  final String description;
  final String description1st;
  final Color color;
  final IconData icon;
  final Color bgColor;
  final String percent;
  final bool box;
  const HoverableStuff1Card({
    super.key,
    required this.title,
    required this.description,
    required this.description1st,
    required this.color,
    required this.icon,
    required this.bgColor,
    required this.percent,
    required this.box,
  });

  @override
  _HoverableStuff1CardState createState() => _HoverableStuff1CardState();
}

class _HoverableStuff1CardState extends State<HoverableStuff1Card> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 600
          ? MediaQuery.of(context).size.width * 0.45
          : MediaQuery.of(context).size.width * 0.21,
      height: MediaQuery.of(context).size.width < 600 ? 230 : 200,
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
          elevation: _hover ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: widget.bgColor,
                      ),
                      child: Icon(widget.icon, color: widget.color, size: 30),
                    ),
                    widget.box
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Home.light
                                  ? Color(0xFFF0FDF4)
                                  : themeColor.blue600.withOpacity(0.2),
                            ),
                            padding: EdgeInsets.fromLTRB(11, 5, 11, 5),
                            child: nearlyMuted(
                              widget.percent,
                              Home.light
                                  ? themeColor.green600
                                  : themeColor.blue400,
                            ),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: themeColor.hsl_MutedTextDark.toColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Sora",
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 15),
                header(widget.description, themeColor.hsl_textDark.toColor()),
                normal(
                  widget.description1st,
                  themeColor.hsl_nearlyMutedTextDark.toColor(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class card0 extends StatefulWidget {
  final int label;
  final String name;
  final String dosage;
  final String? schedule;
  final String? purpose;
  const card0({
    super.key,
    required this.label,
    required this.name,
    required this.dosage,
    this.schedule,
    this.purpose,
  });
  @override
  State<card0> createState() => _card0State();
}

class _card0State extends State<card0> {
  bool _hover = false;

  Widget createCard(String label, String name, String dosage) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: themeColor.hsl_textDark.toColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Sora",
                  letterSpacing: 1.5,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeColor.hsl_bgDark,
                  border: Border.all(color: themeColor.hsl_BorderCardDark),
                ),
                child: Text(
                  '${widget.label}%',
                  style: TextStyle(
                    color: themeColor.hsl_textDark.toColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Sora",
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            dosage,
            style: TextStyle(
              color: Home.light ? themeColor.blue600 : Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Sora",
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Schedule",
                style: TextStyle(
                  color: themeColor.hsl_nearlyMutedTextDark.toColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Sora",
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "Purpose",
                style: TextStyle(
                  color: themeColor.hsl_nearlyMutedTextDark.toColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Sora",
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: themeColor.hsl_textDark.toColor(),
                    size: 19,
                  ),
                  SizedBox(width: 5),
                  bold(
                    widget.schedule ?? "",
                    themeColor.hsl_textDark.toColor(),
                  ),
                ],
              ),
              normal(widget.purpose ?? "", themeColor.hsl_textDark.toColor()),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "This Week",
            style: TextStyle(
              color: themeColor.hsl_nearlyMutedTextDark.toColor(),
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: "Sora",
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 15),
          LinearProgressIndicator(
            value: widget.label / 100,
            color: Home.light ? themeColor.green600 : themeColor.blue600,
            backgroundColor: themeColor.hsl_BorderCardDark,
            minHeight: 7,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Fill available width
      margin: MediaQuery.of(context).size.width < 600
          ? const EdgeInsets.all(3.0)
          : const EdgeInsets.fromLTRB(23.0, 7.0, 23.0, 3.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Card(
          elevation: _hover ? 4 : 1,
          color: themeColor.hsl_CardColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: _hover
                  ? themeColor.hsl_highlightedBorderCardDark
                  : themeColor.hsl_BorderCardDark,
            ),
          ),
          child: createCard('${widget.label}%', widget.name, widget.dosage),
        ),
      ),
    );
  }
}
