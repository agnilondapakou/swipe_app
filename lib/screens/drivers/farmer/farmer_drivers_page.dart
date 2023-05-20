import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/entreprise/top_icons_widget.dart';
import '../../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../../widgets/farmers/farmer_driver_card_widget.dart';

class FarmerDriversPage extends StatefulWidget {
  const FarmerDriversPage({super.key});

  @override
  State<FarmerDriversPage> createState() => _FarmerDriversPageState();
}

class _FarmerDriversPageState extends State<FarmerDriversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Livreurs',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
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
                    'assets/icons/delivery.png',
                  ),
                  desciption:
                      "Enregistrez vos livreurs et assignez-leur\n des commandes",
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
                  "Nouveau Livreur",
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
                    FarmerDriverCardWidget(
                      driver_first_name: "DHL",
                      driver_last_name: "-",
                      delivery_count: 5,
                      driver_email: "dr@gmail.com",
                      driver_phone_number: "90 90 90 90",
                      delete_route: '',
                      update_route: '',
                    ),
                    FarmerDriverCardWidget(
                      driver_first_name: "Koffi",
                      driver_last_name: "Gregoire",
                      delivery_count: 0,
                      driver_email: "gk@gmail.com",
                      driver_phone_number: "00 00 00 00",
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
