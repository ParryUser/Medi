import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Home.dart';

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

Widget finalCard(
  String name,
  String science,
  String dosage,
  String label,
  List<String> useCases,
  List<String> avoidIf,
  List<String> sideEffects,
  List<String> allergicReactions,
  Color labelColor,
  Color labelBg,
  Color borderColor,
) {
  return CustomExpandableCard(
    name: name,
    science: science,
    dosage: dosage,
    label: label,
    labelColor: labelColor,
    borderColor: borderColor,
    labelBg: labelBg,
    useCases: useCases,
    avoidIf: avoidIf,
    sideEffects: sideEffects,
    allergicReactions: allergicReactions,
  );
}

Widget card(
  String medName,
  String scienceName,
  String typicalDosage,
  String works,
  List<String> useCases,
  List<String> avoidIf,
  List<String> sideEffects,
  List<String> allergicReactions,
) {
  return Container(
    padding: EdgeInsets.all(1),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: themeColor.hsl_CardColorDark,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 1, color: Colors.grey[700]),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.green,
                      ),
                      subHeader(" Common Use Cases"),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.circle, size: 5, color: Colors.green),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              useCases[0],
                              style: TextStyle(
                                color: themeColor.hsl_MutedTextDark.toColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Sora",
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.circle, size: 5, color: Colors.green),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              useCases[1],
                              style: TextStyle(
                                color: themeColor.hsl_MutedTextDark.toColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Sora",
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.circle, size: 5, color: Colors.green),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              useCases[2],
                              style: TextStyle(
                                color: themeColor.hsl_MutedTextDark.toColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Sora",
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.circle, size: 5, color: Colors.green),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              useCases[3],
                              style: TextStyle(
                                color: themeColor.hsl_MutedTextDark.toColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Sora",
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: themeColor.hsl_BorderCardDark,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: themeColor.hsl_DosageCardDark.withOpacity(
                            0.50,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.medical_services_outlined,
                                  color: themeColor.zinc500,
                                ),
                                SizedBox(width: 5),
                                subHeader("Typical Dosage"),
                              ],
                            ),
                            SizedBox(height: 10),
                            normal(typicalDosage),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.amber),
                          subHeader(" Possible Side Effects"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.circle, size: 5, color: Colors.amber),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  sideEffects[0],
                                  style: TextStyle(
                                    color: themeColor.hsl_MutedTextDark
                                        .toColor(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.circle, size: 5, color: Colors.amber),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  sideEffects[1],
                                  style: TextStyle(
                                    color: themeColor.hsl_MutedTextDark
                                        .toColor(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.circle, size: 5, color: Colors.amber),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  sideEffects[2],
                                  style: TextStyle(
                                    color: themeColor.hsl_MutedTextDark
                                        .toColor(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.circle, size: 5, color: Colors.amber),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  sideEffects[3],
                                  style: TextStyle(
                                    color: themeColor.hsl_MutedTextDark
                                        .toColor(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Sora",
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: BoxBorder.all(
                                color: Home.light
                                    ? Color(0xFFFECACA)
                                    : HSLColor.fromAHSL(
                                        1.0,
                                        0.0,
                                        0.90,
                                        0.41,
                                      ).toColor().withOpacity(0.50),
                              ),
                              color: Home.light
                                  ? Color(0xFFFEF2F2)
                                  : Color(0xFF460809).withOpacity(0.20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Possible Allergic Reactions",
                                      style: TextStyle(
                                        color: Home.light
                                            ? Color(0xFFB91C1C)
                                            : Color(0xFFF87171),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Sora",
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "(Consult A Doctor If Experienced)",
                                      style: TextStyle(
                                        color: Home.light
                                            ? Color(0xFFB91C1C)
                                            : Color(0xFFF87171),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Sora",
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Text(
                                      "More Of The Common Ones Include:",
                                      style: TextStyle(
                                        color: Home.light
                                            ? Color(0xFFB91C1C)
                                            : Color(0xFFFCA5A5),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Sora",
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.redAccent,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        allergicReactions[0],
                                        style: TextStyle(
                                          color: themeColor.hsl_MutedTextDark
                                              .toColor(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Sora",
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.redAccent,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        allergicReactions[1],
                                        style: TextStyle(
                                          color: themeColor.hsl_MutedTextDark
                                              .toColor(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Sora",
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.redAccent,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        allergicReactions[2],
                                        style: TextStyle(
                                          color: themeColor.hsl_MutedTextDark
                                              .toColor(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Sora",
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: Colors.redAccent,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        allergicReactions[3],
                                        style: TextStyle(
                                          color: themeColor.hsl_MutedTextDark
                                              .toColor(),
                                          fontSize: 16,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(
              color: Home.light
                  ? Color(0xFFFED7AA)
                  : Color(0xFF9A3412).withOpacity(0.50),
            ),
            color: Home.light
                ? Color(0xFFFFF7ED)
                : Color(0xFF452A09).withOpacity(0.20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Avoid If You Have",
                    style: TextStyle(
                      color: Home.light ? Color(0xFFC2410C) : Color(0xFFFB923C),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Sora",
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 5, color: Color(0xFFF97316)),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          sideEffects[0],
                          style: TextStyle(
                            color: themeColor.hsl_MutedTextDark.toColor(),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Sora",
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 5, color: Color(0xFFF97316)),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          sideEffects[1],
                          style: TextStyle(
                            color: themeColor.hsl_MutedTextDark.toColor(),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Sora",
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 5, color: Color(0xFFF97316)),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          sideEffects[2],
                          style: TextStyle(
                            color: themeColor.hsl_MutedTextDark.toColor(),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Sora",
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 5, color: Color(0xFFF97316)),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          sideEffects[3],
                          style: TextStyle(
                            color: themeColor.hsl_MutedTextDark.toColor(),
                            fontSize: 16,
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
            ],
          ),
        ),
      ],
    ),
  );
}

class CustomExpandableCard extends StatefulWidget {
  final String name;
  final String label;
  final Color labelColor;
  final Color labelBg;
  final Color borderColor;
  final String science;
  final String dosage;
  final List<String> useCases;
  final List<String> avoidIf;
  final List<String> sideEffects;
  final List<String> allergicReactions;
  const CustomExpandableCard({
    super.key,
    required this.name,
    required this.label,
    required this.labelColor,
    required this.labelBg,
    required this.borderColor,
    required this.science,
    required this.dosage,
    required this.useCases,
    required this.avoidIf,
    required this.sideEffects,
    required this.allergicReactions,
  });

  @override
  _CustomExpandableCardState createState() => _CustomExpandableCardState();
}

class _CustomExpandableCardState extends State<CustomExpandableCard> {
  bool _open = false;
  bool _hover = false;

  Widget createCard(
    String label,
    Color labelColor,
    Color labelBg,
    Color labelBorder,
    String name,
    String science,
  ) {
    return ListTile(
      tileColor: themeColor.hsl_CardColorDark,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: labelBorder),
                color: labelBg,
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Sora",
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          header(name),
          muted(science),
          SizedBox(height: 15),
          Text(
            "Click for detailed information",
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
      trailing: AnimatedRotation(
        turns: _open ? 0.5 : 0.0,
        duration: Duration(milliseconds: 200),
        child: Icon(Icons.arrow_drop_down),
      ),
      onTap: () => setState(() => _open = !_open),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width < 600
          ? const EdgeInsets.all(3.0)
          : const EdgeInsets.fromLTRB(23.0, 7.0, 23.0, 3.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Card(
          elevation: _hover ? 1 : 0,
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
          clipBehavior: Clip.antiAlias,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                createCard(
                  widget.label,
                  widget.labelColor,
                  widget.labelBg,
                  widget.borderColor,
                  widget.name,
                  widget.science,
                ),
                AnimatedCrossFade(
                  firstChild: SizedBox.shrink(),
                  secondChild: Container(
                    color: themeColor.hsl_CardColorDark,
                    child: Padding(
                      padding: EdgeInsets.all(11),
                      child: card(
                        widget.name,
                        widget.science,
                        widget.dosage,
                        widget.label,
                        widget.useCases,
                        widget.avoidIf,
                        widget.sideEffects,
                        widget.allergicReactions,
                      ),
                    ),
                  ),
                  crossFadeState: _open
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
