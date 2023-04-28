import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';
import '../../../widgets/entreprise/order_card_widget.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FarmerRecoltesPage extends StatefulWidget {
  const FarmerRecoltesPage({super.key});

  @override
  State<FarmerRecoltesPage> createState() => _FarmerRecoltesPageState();
}

class _FarmerRecoltesPageState extends State<FarmerRecoltesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Recoltes',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                  header_image: Image.asset('assets/icons/progress.png'),
                  desciption: "Annocez vos produits prêts à être récoltés",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 100,
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
                  "Nouvelle recolte",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: GlobalColors.whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Column(
                children: [
                  OrderCardWidget(
                    product_name: "Soja",
                    farm_name: "Djidjole",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.logoutColor,
                    button_text: "Retirer l'annonce",
                  ),
                  OrderCardWidget(
                    product_name: "Haricot",
                    farm_name: "Djidjole",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.logoutColor,
                    button_text: "Retirer l'annonce",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
