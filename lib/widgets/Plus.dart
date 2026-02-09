import 'package:flutter/material.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';
import 'package:flutterfirsttest/widgets/Add.dart';

class Plus {
  Future<bool?> showConfirmBox(
    BuildContext context, {
    VoidCallback? onMedicineAdded,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Confirm",
      barrierColor: Colors.black54,
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeColor.hsl_CardColorDark,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Saira",
                      fontSize: 18,
                      color: themeColor.hsl_textDark.toColor(),
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 17),

                  Center(child: SegButtons()),

                  const SizedBox(height: 17),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context, true);
                            await addTimer(
                              context,
                              onMedicineAdded: onMedicineAdded,
                            );
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              fontFamily: "Saira",
                              fontWeight: FontWeight.bold,
                              color: themeColor.purple400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontFamily: "Saira",
                              fontWeight: FontWeight.bold,
                              color: themeColor.purple400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
