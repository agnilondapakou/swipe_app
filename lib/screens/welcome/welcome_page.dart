import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigation à l'écran suivant après 3 secondes.
      Navigator.pushReplacementNamed(context, '/login');
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
              ),
              SizedBox(height: 60),
              // powered by GEEKS CODE
              Text(
                'Powered by GEEKS CODE',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  // color code #4D6346
                  color: Color.fromARGB(101, 77, 99, 70),
                ),
              ),
            ],
          ),
        ));
  }
}
