import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/nav_bar_widget.dart';
import 'package:swipe_app/widgets/profile_image_widget.dart';
import 'package:swipe_app/widgets/top_bar_widget.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  String username;
  String usermail;
  ProfilePage({required this.username, required this.usermail, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWidget(
        title: 'Profile',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 1,
      ),
      body: Scaffold(
        backgroundColor: GlobalColors.secondaryColor,
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color code #4D6346
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                usermail,
                style: TextStyle(
                  fontSize: 16,
                  // color code #4D6346
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 20),
              // button logout
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.logoutColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 17),
                ),
                child: const Text(
                  'Se deconnecter',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // powered by GEEKS CODE
              const Text(
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
        ),
      ),
    );
  }
}
