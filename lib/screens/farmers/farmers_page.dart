import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/entreprise/nav_bar_widget.dart';
import '../../../widgets/entreprise/top_bar_widget.dart';
import '../../widgets/entreprise/farmer_card_widget copy.dart';

class FarmersPage extends StatefulWidget {
  const FarmersPage({super.key});

  @override
  State<FarmersPage> createState() => _FarmersPageState();
}

class _FarmersPageState extends State<FarmersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Livreurs',
        sub_title: 'Entreprise',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                  header_image: Image.asset(
                    'assets/icons/farmer.png',
                  ),
                  desciption:
                      "Enregistrez vos livreurs et assignez-leur des commandes",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 200,
              height: 40,
              decoration: BoxDecoration(
                color: GlobalColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  // new popup with form to add an recolte
                },
                child: Text(
                  "Nouvel agriculteur",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: GlobalColors.whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    FarmerCardWidget(
                      farmer_first_name: "John",
                      farmer_last_name: "Doe",
                      ferme_count: 5,
                      farmer_email: "johndoe@gmail.com",
                      farmer_phone_number: "90 90 90 90",
                      delete_route: '',
                      update_route: '',
                    ),
                    FarmerCardWidget(
                      farmer_first_name: "Koffi",
                      farmer_last_name: "Gregoire",
                      ferme_count: 0,
                      farmer_email: "gregoirek@gmail.com",
                      farmer_phone_number: "00 00 00 00",
                      delete_route: '',
                      update_route: '',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
