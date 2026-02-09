import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';

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

Widget barChart(double chartWidth, double chartHeight) {
  return test(chartWidth: chartWidth, chartHeight: chartHeight);
}

Widget pieChart(
  double chartWidth,
  double chartHeight,
  Color color0,
  Color color1,
  Color color2,
  Color color3,
  double percent0,
  double percent1,
  double percent2,
  double percent3,
  double degree,
) {
  return test1(
    chartWidth: chartWidth,
    chartHeight: chartHeight,
    color0: color0,
    color1: color1,
    color2: color2,
    color3: color3,
    percent0: percent0,
    percent1: percent1,
    percent2: percent2,
    percent3: percent3,
    degree: degree,
  );
}

class test1 extends StatefulWidget {
  final double chartWidth;
  final double chartHeight;
  final Color color0;
  final Color color1;
  final Color color2;
  final Color color3;
  final double percent0;
  final double percent1;
  final double percent2;
  final double percent3;
  final double degree;
  const test1({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.color0,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.percent0,
    required this.percent1,
    required this.percent2,
    required this.percent3,
    required this.degree,
  });

  @override
  State<StatefulWidget> createState() => test1State();
}

class test1State extends State<test1> {
  int touchedIndex = -1;

  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.chartWidth,
      height: widget.chartHeight,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Card(
          color: themeColor.hsl_bgDark,
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
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13),
                      child: bold(
                        "Side Effect Distribution",
                        themeColor.hsl_textDark.toColor(),
                      ),
                    ),
                  ],
                ),
                                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      color: widget.color0,
                      text: 'None',
                      isSquare: false,
                      size: touchedIndex == 0 ? 19 : 16,
                      textColor: touchedIndex == 0
                          ? themeColor.hsl_textDark.toColor()
                          : themeColor.hsl_nearlyMutedTextDark.toColor(),
                      percent: '${widget.percent0}%',
                      theColor: widget.color0,
                    ),
                    Indicator(
                      color: widget.color1,
                      text: 'Mild',
                      isSquare: false,
                      size: touchedIndex == 1 ? 19 : 16,
                      textColor: touchedIndex == 1
                          ? themeColor.hsl_textDark.toColor()
                          : themeColor.hsl_nearlyMutedTextDark.toColor(),
                      percent: '${widget.percent1}%',
                      theColor: widget.color1,
                    ),
                    Indicator(
                      color: widget.color2,
                      text: 'Moderate',
                      isSquare: false,
                      size: touchedIndex == 2 ? 19 : 16,
                      textColor: touchedIndex == 2
                          ? themeColor.hsl_textDark.toColor()
                          : themeColor.hsl_nearlyMutedTextDark.toColor(),
                      percent: '${widget.percent2}%',
                      theColor: widget.color2,
                    ),
                    Indicator(
                      color: widget.color3,
                      text: 'Severe',
                      isSquare: false,
                      size: touchedIndex == 3 ? 19 : 16,
                      textColor: touchedIndex == 3
                          ? themeColor.hsl_textDark.toColor()
                          : themeColor.hsl_nearlyMutedTextDark.toColor(),
                      percent: '${widget.percent3}%',
                      theColor: widget.color3,
                    ),
                  ],
                ),
                const SizedBox(height: 19),
                Expanded(
                  child: SizedBox(
                    width: widget.chartWidth,
                    height: widget.chartHeight,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!
                                      .touchedSectionIndex;
                                });
                              },
                        ),
                        startDegreeOffset: widget.degree,
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 1,
                        centerSpaceRadius: 0,
                        sections: showingSections(),
                      ),
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

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final color0 = widget.color0;
      final color1 = widget.color1;
      final color2 = widget.color2;
      final color3 = widget.color3;

      return switch (i) {
        0 => PieChartSectionData(
          color: color0,
          value: widget.percent0,
          title: '',
          radius: 130,
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withOpacity(0)),
        ),
        1 => PieChartSectionData(
          color: color1,
          value: widget.percent1,
          title: '',
          radius: 130,
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withOpacity(0)),
        ),
        2 => PieChartSectionData(
          color: color2,
          value: widget.percent2,
          title: '',
          radius: 130,
          titlePositionPercentageOffset: 0.6,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withOpacity(0)),
        ),
        3 => PieChartSectionData(
          color: color3,
          value: widget.percent3,
          title: '',
          radius: 130,
          titlePositionPercentageOffset: 0.55,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 6)
              : BorderSide(color: Colors.white.withOpacity(0)),
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }
}

class test extends StatefulWidget {
  test({super.key, required this.chartWidth, required this.chartHeight});
  final double chartWidth;
  final double chartHeight;
  final Color leftBarColor = themeColor.green600;
  final Color rightBarColor = Color(0xFFEF4444);
  final Color avgColor = themeColor.blue600;

  @override
  State<StatefulWidget> createState() => testState();
}

class testState extends State<test> {
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.chartWidth,
      height: widget.chartHeight,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Card(
          color: themeColor.hsl_bgDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: _hover
                  ? themeColor.hsl_highlightedBorderCardDark
                  : themeColor.hsl_BorderCardDark,
            ),
          ),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 9),
                Container(
                  margin: EdgeInsets.only(left: 13),
                  child: bold(
                    "Weekly Medication Adherence",
                    themeColor.hsl_textDark.toColor(),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 25,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: ((group) {
                            return Colors.grey;
                          }),
                          getTooltipItem: (a, b, c, d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          if (response == null || response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroups = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (final rod
                                  in showingBarGroups[touchedGroupIndex]
                                      .barRods) {
                                sum += rod.toY;
                              }
                              final avg =
                                  sum /
                                  showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .map((rod) {
                                          return rod.copyWith(
                                            toY: avg,
                                            color: widget.avgColor,
                                          );
                                        })
                                        .toList(),
                                  );
                            }
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            interval: 1,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: showingBarGroups,
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5) {
      text = '1';
    } else if (value == 10) {
      text = '1.5';
    } else if (value == 15) {
      text = '2';
    } else if (value == 20) {
      text = '2.5';
    } else if (value == 25) {
      text = '3';
    } else {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: widget.leftBarColor, width: width),
        BarChartRodData(toY: y2, color: widget.rightBarColor, width: width),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
    this.percent, // Added percentage parameter
    this.theColor, // Added color parameter for the percentage container
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;
  final String? percent; // Percentage to display under text
  final Color? theColor; // Added color parameter for the percentage container

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        if (percent != null) // Show percentage if provided
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Text(
                percent!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: themeColor.zinc50,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
