import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/api_response.dart';
import '../../services/auth/auth_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void checkUserSession() async {
    ApiResponse response = await isLoggedIn();
    setState(() {
      var currentUser = response.data;
      Timer(const Duration(seconds: 3), () {
        // Navigation à l'écran suivant après 3 secondes.
        if (currentUser != null) {
          // L'utilisateur est déjà connecté, rediriger vers la page d'accueil
          Navigator.pushReplacementNamed(context, '/farmers/home');
        } else {
          // L'utilisateur n'est pas connecté, continuer avec la logique existante
            Navigator.pushReplacementNamed(context, '/login');
          }
      });
    });
  }
  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColors.whiteColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/icons/logo.png"), width: 150),
              const SizedBox(
                height: 20,
              ),
              const SpinKitChasingDots(
                color: Colors.green,
                size: 80.0,
              ),
              const SizedBox(height: 60),
              Text(
                'Powered by GEEKS CODE',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color.fromARGB(101, 77, 99, 70),
                ),
              ),
            ],
          ),
        ));
  }
}
