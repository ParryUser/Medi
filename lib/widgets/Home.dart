import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterfirsttest/widgets/My_CardLabels.dart';
import 'package:flutterfirsttest/widgets/MiddleBar.dart';
import 'package:flutterfirsttest/widgets/Labels.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Options.dart';
import 'package:flutterfirsttest/widgets/Plus.dart';
import 'package:flutterfirsttest/db/DataBaseHelper.dart';
import 'package:flutterfirsttest/networking/Server.dart';

class Home extends StatefulWidget {
  static bool light = false;
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List<Proto> cards = kIsWeb
      ? [
          Proto(
            DateAndTimes: cool.a,
            medName: "Panadol",
            days: "Sun, Mon, Tue, Wed, Thu",
          ),
          Proto(
            DateAndTimes: cool.b,
            medName: "Albuterol",
            days: "Sun, Tue, Sat",
          ),
          Proto(
            DateAndTimes: cool.c,
            medName: "Enalapril",
            days: "Wed, Thu, Fri",
          ),
          Proto(DateAndTimes: cool.d, medName: "Aspirin", days: "Fri, Sat"),
        ]
      : [];
  DateTime? CombinedDateTime;
  String? SelectedMedName;
  Plus c = Plus();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    Labels.cardInfo.sort(
      (a, b) => a.DateAndTimes.hour.compareTo(b.DateAndTimes.hour),
    );
  }

  List<My_CardLabels> HowToView() {
    if (MiddleBar.hide == true) {
      return [];
    }
    return Labels.cardInfo
        .map(
          (card) => My_CardLabels(
            key: ValueKey(
              '${card.id ?? card.medName}_${card.DateAndTimes.millisecondsSinceEpoch}_${card.days}',
            ),
            label: card,
            delete: () async {
              final db = DataBaseHelper();

              if (card.id != null) {
                await db.deleteLabel(card.id!);
              }
              setState(() {
                Labels.cardInfo.remove(card);
              });
            },
            refresh: () {
              setState(() {});
            },
          ),
        )
        .toList();
  }

  List<My_CardLabels> ProtoView() {
    if (!kIsWeb || MiddleBar.hide == true) {
      return [];
    }
    return cards
        .map(
          (card) => My_CardLabels(
            key: ValueKey(
              'proto_${card.medName}_${card.DateAndTimes.millisecondsSinceEpoch}_${card.days}',
            ),
            proto: card,
            delete: () {
              setState(() {
                cards.remove(card);
              });
            },
            refresh: () {
              setState(() {});
            },
          ),
        )
        .toList();
  }

  void changeTheme() {
    setState(() {
      Home.light = !Home.light;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _hover = false;
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
      themeColor.hsl_plusDark = HSLColor.fromAHSL(1.0, 221.21, 0.83, 0.53);
      themeColor.hsl_calendarDark = HSLColor.fromAHSL(1.0, 258.0, 0.58, 0.78);
      themeColor.hsl_CardColorDark = Color(0xFFFFFFFF);
      themeColor.hsl_DosageCardDark = themeColor.gray50;
      themeColor.hsl_BorderCardDark = themeColor.gray200;
      themeColor.hsl_highlightedBorderCardDark = themeColor.gray300;
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
      themeColor.hsl_plusDark = HSLColor.fromAHSL(1.0, 217, 0.37, 0.42);
      themeColor.hsl_calendarDark = HSLColor.fromAHSL(1.0, 258.0, 0.58, 0.42);
      themeColor.hsl_CardColorDark = themeColor.zinc900;
      themeColor.hsl_DosageCardDark = themeColor.zinc950.withOpacity(0.5);
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
          selectedIndex: 0,
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
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.fromLTRB(5, 10, 15, 10),
                          child: TextButton.icon(
                            icon: Icon(
                              Icons.nightlight_outlined,
                              size: 30,
                              color: themeColor.hsl_textDark.toColor(),
                            ),
                            onPressed: () => changeTheme(),
                            label: Text(
                              "MediHome",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Sora",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                height: 1.5,
                                color: themeColor.hsl_textDark.toColor(),
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                        Builder(
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Medicine(s)",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              height: 1.5,
                              color: themeColor.hsl_textDark.toColor(),
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Waiting For ${Labels.cardInfo.length + (kIsWeb ? cards.length : 0)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              height: 1.5,
                              color: themeColor.hsl_MutedTextDark.toColor(),
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      color: themeColor.hsl_bgDark,
                      child: TabBar(
                        controller: _tabController,
                        dividerColor: Colors.transparent,
                        indicatorColor: themeColor.hsl_textDark.toColor(),
                        labelColor: themeColor.hsl_textDark.toColor(),
                        unselectedLabelColor: themeColor.hsl_MutedTextDark
                            .toColor(),
                        tabs: [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.bar_chart),
                                  SizedBox(width: 6),
                                  Text("Alarms"),
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
                                  Icon(Icons.auto_awesome),
                                  SizedBox(width: 6),
                                  Text("AI Assistant"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    MiddleBar(
                      ChangeLabelsOrder: (bool ascending) {
                        setState(() {
                          if (ascending) {
                            Labels.cardInfo.sort(
                              (a, b) =>
                                  a.DateAndTimes.compareTo(b.DateAndTimes),
                            );
                            if (kIsWeb) {
                              cards.sort(
                                (a, b) =>
                                    a.DateAndTimes.compareTo(b.DateAndTimes),
                              );
                            }
                          } else {
                            Labels.cardInfo.sort(
                              (a, b) =>
                                  b.DateAndTimes.compareTo(a.DateAndTimes),
                            );
                            if (kIsWeb) {
                              cards.sort(
                                (a, b) =>
                                    b.DateAndTimes.compareTo(a.DateAndTimes),
                              );
                            }
                          }
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    if (Labels.cardInfo.isEmpty && (!kIsWeb || cards.isEmpty))
                      SizedBox(
                        height: 250,
                        child: Center(
                          child: Text(
                            'There Are No Alarms Set.',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.normal,
                              letterSpacing: 2.0,
                              height: 1.5,
                              color: themeColor.hsl_MutedTextDark.toColor(),
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [...HowToView()],
                    ),
                    kIsWeb && cards.isNotEmpty
                        ? Column(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [...ProtoView()],
                              ),
                              SizedBox(height: 30),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 19, 10, 0),
                  color: themeColor.hsl_bgDark,
                  child: TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    indicatorColor: themeColor.hsl_textDark.toColor(),
                    labelColor: themeColor.hsl_textDark.toColor(),
                    unselectedLabelColor: themeColor.hsl_MutedTextDark
                        .toColor(),
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.bar_chart),
                              SizedBox(width: 6),
                              Text("Alarms"),
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
                              Icon(Icons.auto_awesome),
                              SizedBox(width: 6),
                              Text("AI Assistant"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Home.light ? themeColor.zinc100 : themeColor.zinc950.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: themeColor.hsl_BorderCardDark,
                        ),
                      ),
                      child: PersistentChatWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _tabController.index == 0
          ? MouseRegion(
              onEnter: (_) => setState(() => _hover = true),
              onExit: (_) => setState(() => _hover = false),
              child: FloatingActionButton(
                onPressed: () async {
                  bool? confirm = await c.showConfirmBox(
                    context,
                    onMedicineAdded: () {
                      setState(() {});
                    },
                  );
                  if (confirm == true) {
                    setState(() {});
                  }
                },
                elevation: _hover ? 1 : 0,
                backgroundColor: themeColor.hsl_LabelDark2.toColor(),
                shape: CircleBorder(
                  side: BorderSide(
                    color: HSLColor.fromAHSL(1.0, 274, 0.0, 0.5).toColor(),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: themeColor.hsl_textDark.toColor(),
                ),
              ),
            )
          : null,
    );
  }
}
