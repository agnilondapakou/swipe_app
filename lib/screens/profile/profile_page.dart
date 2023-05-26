import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/entreprise/nav_bar_widget.dart';

import '../../widgets/entreprise/profile_image_widget.dart';
import '../../widgets/entreprise/top_bar_widget.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  String username;
  String usermail;
  ProfilePage({required this.username, required this.usermail, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Profile',
        sub_title: 'Entreprise',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person),
        notification_counter: 0,
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 0,
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
                  // color code #4D6346
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                usermail,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  // color code #4D6346
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 20),
              // button logout
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
              // powered by GEEKS CODE
              Text(
                'Powered by GEEKS CODE',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  // color code #4D6346
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
