import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutterfirsttest/widgets/themeColor.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    print("loading");
    super.initState();
      Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/first');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor.zinc900,
      body: Center(
        child: Lottie.asset(
          'assets/loading.json',
          width: 199,
          height: 199,
          animate: true,
          repeat: true,
        ),
      ),
    );
  }
}
