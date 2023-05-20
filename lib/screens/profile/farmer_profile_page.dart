import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/services/auth/auth_service.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../models/api_response.dart';
import '../../widgets/entreprise/profile_image_widget.dart';
import '../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../widgets/farmers/farmer_top_bar_widget.dart';
import '../login/login_page.dart';

class FarmerProfilePage extends StatefulWidget {
  const FarmerProfilePage({Key? key}) : super(key: key);

  @override
  _FarmerProfilePageState createState() => _FarmerProfilePageState();
}

class _FarmerProfilePageState extends State<FarmerProfilePage> {
  var info;
  String username = '';
  String userinfo = '';
  bool isLoading = true;

  void logoutUser(BuildContext context) async {
    ApiResponse response = await logout();
    if (response.data != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Vous êtes déconnecté"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Déconnexion échouée"),
        ),
      );
    }
  }

  void getUserInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getUser();
    if (response.data != null) {
      setState(() {
        info = response.data;
        username = info['username'];
        userinfo = info['userinfo'];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
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
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImageWidget(
                  profile_image:
                  Image.asset('assets/images/profile.jpg')),
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
                userinfo,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  logoutUser(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.logoutColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 17),
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

/*Row(
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
              ),*/