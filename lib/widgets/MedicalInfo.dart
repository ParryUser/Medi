import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Options.dart';
import 'package:flutterfirsttest/widgets/MedCards.dart';
import 'package:flutterfirsttest/widgets/Medications.dart';
import 'package:flutterfirsttest/widgets/Home.dart';

class Medical extends StatefulWidget {
  const Medical({super.key});

  @override
  State<Medical> createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  @override
  Widget build(BuildContext context) {
    if (Home.light == true) {
      themeColor.hsl_bgDark = HSLColor.fromAHSL(
        1.0,
        210.0,
        0.2,
        0.98,
      ).toColor();
      themeColor.hsl_textDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.1);
      themeColor.hsl_nearlyMutedTextDark = HSLColor.fromAHSL(
        1.0,
        0.0,
        0.0,
        0.25,
      );
      themeColor.hsl_MutedTextDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.35);
      themeColor.hsl_CardColorDark = Color(0xFFFFFFFF);
      themeColor.hsl_DosageCardDark = themeColor.gray50;
      themeColor.hsl_BorderCardDark = themeColor.gray200;
      themeColor.hsl_highlightedBorderCardDark = themeColor.gray300;
    } else {
      themeColor.hsl_bgDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.0).toColor();
      themeColor.hsl_textDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.9);
      themeColor.hsl_nearlyMutedTextDark = HSLColor.fromAHSL(
        1.0,
        0.0,
        0.0,
        0.75,
      );
      themeColor.hsl_MutedTextDark = HSLColor.fromAHSL(1.0, 0.0, 0.0, 0.65);
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
          selectedIndex: 2,
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
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            margin: EdgeInsets.fromLTRB(10, 10, 15, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              boxShadow: [
                                BoxShadow(
                                  color: themeColor.zinc950.withOpacity(0.5),
                                  blurRadius: 3,
                                  spreadRadius: 0.5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                transform: GradientRotation(
                                  45 * 3.141592653589793 / 180,
                                ),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() => Home.light = !Home.light);
                              },
                              icon: Icon(
                                Icons.health_and_safety_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Text(
                              "MedInfo",
                              style: TextStyle(
                                color: themeColor.hsl_textDark.toColor(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Sora",
                                letterSpacing: 2.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 199,
                    child: Stack(
                      children: [
                        // Background containers first
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            gradient: LinearGradient(
                              colors: [
                                Home.light
                                    ? Color(0xFF111827).withOpacity(0.1)
                                    : themeColor.blue600.withOpacity(0.1),
                                Home.light
                                    ? Color(0xFF1E40AF).withOpacity(0.1)
                                    : themeColor.purple600.withOpacity(0.1),
                                Home.light
                                    ? Color(0xFF6B21A8).withOpacity(0.1)
                                    : themeColor.pink600.withOpacity(0.1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              transform: GradientRotation(
                                45 * 3.141592653589793 / 180,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              gradient: RadialGradient(
                                center: Alignment.center,
                                radius: 0.5,
                                colors: [
                                  Color(0xFF3B82F6).withOpacity(0.1),
                                  Colors.transparent,
                                ],
                                transform: GradientRotation(
                                  45 * 3.141592653589793 / 180,
                                ),
                                stops: const [0.0, 1.0],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Home.light
                                        ? Color(0xFFBFDBFE)
                                        : Color(0xFF1D4ED8).withOpacity(0.5),
                                  ),
                                  color: Home.light
                                      ? Color(0xFFEFF6FF)
                                      : themeColor.blue950.withOpacity(0.5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: themeColor.blue600,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      "Essential Medical Information",
                                      style: TextStyle(
                                        color: Home.light
                                            ? Color(0xFF1D4ED8)
                                            : Colors.blue[400],
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Sora",
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Common Medications Guide",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: themeColor.hsl_textDark.toColor(),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Sora",
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Detailed information about widely-used medications. Their uses, dosages, and critical safety warnings.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: themeColor.hsl_nearlyMutedTextDark
                                      .toColor(),
                                  fontSize: 16,
                                  fontFamily: "Sora",
                                  letterSpacing: 1.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                              SizedBox(height: 15),
            
                finalCard(
                  Panadol.name,
                  Panadol.scientificName,
                  Panadol.dosage,
                  Panadol.label,
                  Panadol.PanadolUseCases,
                  Panadol.PanadolavoidIf,
                  Panadol.PanadolsideEffects,
                  Panadol.PanadolAllergicReactions,
                  Home.light ? Color(0xFF1D4ED8) : Color(0xFF60A5FA),
                  Home.light
                      ? Color(0xFFEFF6FF)
                      : themeColor.blue950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFFBFDBFE)
                      : Color(0xFF1D4ED8).withOpacity(0.5),
                ),
                finalCard(
                  Aspirin.name,
                  Aspirin.scientificName,
                  Aspirin.dosage,
                  Aspirin.label,
                  Aspirin.AspirinUseCases,
                  Aspirin.AspirinavoidIf,
                  Aspirin.AspirinsideEffects,
                  Aspirin.AspirinAllergicReactions,
                  Home.light ? Color(0xFFB91C1C) : Color(0xFFF87171),
                  Home.light
                      ? Color(0xFFFEF2F2)
                      : themeColor.red950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFFFECACA)
                      : Color(0xFF991B1B).withOpacity(0.5),
                ),
                finalCard(
                  Albuterol.name,
                  Albuterol.scientificName,
                  Albuterol.dosage,
                  Albuterol.label,
                  Albuterol.AlbuterolUseCases,
                  Albuterol.AlbuterolavoidIf,
                  Albuterol.AlbuterolsideEffects,
                  Albuterol.AlbuterolAllergicReactions,
                  Home.light ? Color(0xFF7E22CE) : themeColor.purple400,
                  Home.light
                      ? Color(0xFFFAF5FF)
                      : themeColor.purple950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFFE9D5FF)
                      : Color(0xFF6B21A8).withOpacity(0.5),
                ),
                finalCard(
                  Enalapril.name,
                  Enalapril.scientificName,
                  Enalapril.dosage,
                  Enalapril.label,
                  Enalapril.EnalaprilUseCases,
                  Enalapril.EnalaprilavoidIf,
                  Enalapril.EnalaprilsideEffects,
                  Enalapril.EnalaprilAllergicReactions,
                  Home.light ? Color(0xFF15803D) : themeColor.green400,
                  Home.light
                      ? Color(0xFFF0FDF4)
                      : themeColor.green950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFFBBF7D0)
                      : Color(0xFF166534).withOpacity(0.5),
                ),
                finalCard(
                  Lisinopril.name,
                  Lisinopril.scientificName,
                  Lisinopril.dosage,
                  Lisinopril.label,
                  Lisinopril.LisinoprilUseCases,
                  Lisinopril.LisinoprilavoidIf,
                  Lisinopril.LisinoprilsideEffects,
                  Lisinopril.LisinoprilAllergicReactions,
                  Home.light ? Color(0xFFC2410C) : themeColor.orange400,
                  Home.light
                      ? Color(0xFFFFF7ED)
                      : themeColor.orange950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFFFED7AA)
                      : Color(0xFFC2410C).withOpacity(0.5),
                ),
                finalCard(
                  Loratadine.name,
                  Loratadine.scientificName,
                  Loratadine.dosage,
                  Loratadine.label,
                  Loratadine.LoratadineUseCases,
                  Loratadine.LoratadineavoidIf,
                  Loratadine.LoratadinesideEffects,
                  Loratadine.LoratadineAllergicReactions,
                  Home.light ? Color(0xFF0F766E) : themeColor.teal400,
                  Home.light
                      ? Color(0xFFF0FDFA)
                      : themeColor.teal950.withOpacity(0.5),
                  Home.light
                      ? Color(0xFF99F6E4)
                      : Color(0xFF0F766E).withOpacity(0.5),
                ),
                SizedBox(height: 10),
                //We Could Try Something Different Here.
                Wrap(
                  children: [
                    stuff(
                      themeColor.blue600,
                      themeColor.cyan600,
                      Icons.link_outlined,
                      Colors.white,
                      "Types Of Medicines",
                      'Medications come in various forms including tablets, capsules, liquids, injections, and topical applications, each designed for specific administration methods.',
                    ),
                    SizedBox(height: 15),
                    stuff(
                      themeColor.purple600,
                      themeColor.pink600,
                      Icons.biotech_outlined,
                      Colors.white,
                      "How They Work",
                      'Medicines work by interacting with the body\'s biological systems to treat, cure, or prevent illnesses, often by targeting specific cells or receptors and specific biological processes.',
                    ),
                    SizedBox(height: 15),
                    stuff(
                      themeColor.orange600,
                      Color(0xFFEF4444),
                      Icons.access_time_outlined,
                      Colors.white,
                      "Proper Dosage",
                      'Taking the correct dosage of medication is crucial for effectiveness and safety; always follow healthcare provider instructions and read labels carefully.',
                    ),
                    SizedBox(height: 15),
                    stuff(
                      themeColor.green600,
                      themeColor.teal600,
                      Icons.shield_outlined,
                      Colors.white,
                      "Safety Precautions",
                      'Always store medicines properly by keeping the medications in cool, dry places away from direct sunlight. Keep them out of reach of children.',
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MediaQuery.of(context).size.width < 600
                              ? SizedBox(width: 27)
                              : SizedBox(width: 45),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: themeColor.green600,
                            size: 30,
                          ),
                          SizedBox(width: 5),
                          subHeader("Proper Medication Benefits"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Wrap(
                    children: [
                      stuff1(
                        "Disease Management",
                        'Effectively control chronic conditions and improve quality of life when taken as prescribed.',
                      ),
                      SizedBox(width: 15),
                      stuff1(
                        "Pain Relief",
                        'Alleviate discomfort and pain, allowing for better daily functioning and recovery.',
                      ),
                      SizedBox(width: 15),
                      stuff1(
                        "Prevention",
                        'Prevent diseases and complications before occuring through vaccines & medication.',
                      ),
                    ],
                  ),
                ),
                stuff3(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stuff(
    Color color0,
    Color color1,
    IconData icon,
    Color iconColor,
    String title,
    String description,
  ) {
    return HoverableStuffCard(
      color0: color0,
      color1: color1,
      icon: icon,
      iconColor: iconColor,
      title: title,
      description: description,
    );
  }

  Widget stuff1(String title, String description) {
    return HoverableStuff1Card(title: title, description: description);
  }

  Widget stuff3() {
    return HoverableStuff3Card();
  }

  Widget header(String text) {
    return Text(
      text,
      style: TextStyle(
        color: themeColor.hsl_textDark.toColor(),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Sora",
        letterSpacing: 2.0,
      ),
    );
  }

  Widget subHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        color: themeColor.hsl_textDark.toColor(),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Sora",
        letterSpacing: 1.5,
      ),
    );
  }

  Widget bold(String text) {
    return Text(
      text,
      style: TextStyle(
        color: themeColor.hsl_textDark.toColor(),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Sora",
        letterSpacing: 2.0,
      ),
    );
  }

  Widget normal(String text) {
    return Text(
      text,
      style: TextStyle(
        color: themeColor.hsl_textDark.toColor(),
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: "Sora",
        letterSpacing: 1.5,
      ),
    );
  }

  Widget muted(String text) {
    return Text(
      text,
      style: TextStyle(
        color: themeColor.hsl_MutedTextDark.toColor(),
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: "Sora",
        letterSpacing: 1.5,
      ),
    );
  }
}

class HoverableStuffCard extends StatefulWidget {
  final Color color0;
  final Color color1;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const HoverableStuffCard({
    super.key,
    required this.color0,
    required this.color1,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  _HoverableStuffCardState createState() => _HoverableStuffCardState();
}

class _HoverableStuffCardState extends State<HoverableStuffCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.47,
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
              width: 2,
            ),
          ),
          elevation: _hover ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                      colors: [widget.color0, widget.color1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(45 * 3.141592653589793 / 180),
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(widget.icon, color: widget.iconColor, size: 28),
                ),
                SizedBox(height: 15),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: themeColor.hsl_textDark.toColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sora",
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: themeColor.hsl_nearlyMutedTextDark.toColor(),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverableStuff1Card extends StatefulWidget {
  final String title;
  final String description;

  const HoverableStuff1Card({
    super.key,
    required this.title,
    required this.description,
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
          ? MediaQuery.of(context).size.width * 0.90
          : MediaQuery.of(context).size.width * 0.30,
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
              width: 2,
            ),
          ),
          elevation: _hover ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_outlined,
                  color: themeColor.green600,
                  size: 30,
                ),
                SizedBox(height: 5),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: themeColor.hsl_textDark.toColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sora",
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: themeColor.hsl_nearlyMutedTextDark.toColor(),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverableStuff3Card extends StatefulWidget {
  const HoverableStuff3Card({super.key});

  @override
  _HoverableStuff3CardState createState() => _HoverableStuff3CardState();
}

class _HoverableStuff3CardState extends State<HoverableStuff3Card> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 7.0, 23.0, 7.0),
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
              width: 2,
            ),
          ),
          elevation: _hover ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_alt_rounded,
                                color: Color(0xFFEAB308),
                                size: 30,
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "High Risk Groups",
                                  style: TextStyle(
                                    color: Color(0xFFFACC15),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Sora",
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MediaQuery.of(context).size.width < 600
                              ? SizedBox(height: 17)
                              : SizedBox(height: 10),
                          Text(
                            "People Who Should Be Extra Careful:",
                            style: TextStyle(
                              color: themeColor.hsl_textDark.toColor(),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Sora",
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 13),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEAB308),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Those with known drug allergies",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEAB308),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Individuals with liver or kidney disease",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEAB308),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "People taking multiple medications",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEAB308),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Those with compromised immune systems",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediaQuery.of(context).size.width < 600
                              ? SizedBox(height: 72)
                              : SizedBox(height: 35),
                          Text(
                            "Warining Signs To Watch For(Consult A Doctor):",
                            style: TextStyle(
                              color: themeColor.hsl_textDark.toColor(),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Sora",
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEF4444),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Difficulty breathing or swelling of face/throat",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEF4444),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Severe rash, hives, or itching",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEF4444),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Rapid heartbeat or chest pain",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFEF4444),
                              ),
                              SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  "Severe dizziness or loss of consciousness",
                                  style: TextStyle(
                                    color: themeColor.hsl_nearlyMutedTextDark
                                        .toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Home.light
                            ? Color(0xFFFECACA)
                            : Color(0xFF991B1B).withOpacity(0.5),
                      ),
                      color: Home.light
                          ? Color(0xFFFEF2F2)
                          : themeColor.red950.withOpacity(0.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Emergency: ",
                              style: TextStyle(
                                color: Home.light
                                    ? Color(0xFFB91C1C)
                                    : Color(0xFFF87171),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Sora",
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              "If you experience",
                              style: TextStyle(
                                color: Home.light
                                    ? Color(0xFFB91C1C)
                                    : Color(0xFFF87171),
                                fontFamily: "Sora",
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "any severe reactions, seek immediate medical attention or call emergency services.",
                          style: TextStyle(
                            color: Home.light
                                ? Color(0xFFB91C1C)
                                : Color(0xFFF87171),
                            fontFamily: "Sora",
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
