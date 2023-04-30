// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../widgets/entreprise/profile_image_widget.dart';
import '../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../widgets/farmers/farmer_top_bar_widget.dart';

// ignore: must_be_immutable
class FarmerProfilePage extends StatelessWidget {
  String username;
  String usermail;
  int fermes_count;
  int delivery_count;
  FarmerProfilePage(
      {required this.username, required this.usermail, required this.delivery_count, required this.fermes_count, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Profile',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 2,
      ),
      body: Scaffold(
        backgroundColor: GlobalColors.whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImageWidget(
                  profile_image: Image.asset('assets/images/profile.jpg')),
              const SizedBox(height: 20),
              Text(
                username,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                usermail,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fermes_count.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    " : Fermes",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    delivery_count.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    " : Livraisons",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.logoutColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 17),
                ),
                child: Text(
                  'Se deconnecter',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
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
        ),
      ),
    );
  }
}
