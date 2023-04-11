import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigation à l'écran suivant après 3 secondes.
      Navigator.pushReplacementNamed(context, '/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColors.secondaryColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  image: AssetImage("assets/images/farmHall.png"), width: 500),
              SizedBox(
                height: 50,
              ),
              SpinKitChasingDots(
                color: Colors.green,
                size: 80.0,
              )
            ],
          ),
        ));
  }
}
