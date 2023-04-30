import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../widgets/farmers/farme_card_widget.dart';

class FermePage extends StatefulWidget {
  const FermePage({super.key});

  @override
  State<FermePage> createState() => _FermePageState();
}

class _FermePageState extends State<FermePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Fermes',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 3,
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
                    'assets/icons/location.png',
                  ),
                  desciption: "Annocez vos produits prêts à être récoltés",
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
                  "Nouvelle ferme",
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
                children: const [
                  FermeCardWidget(
                    ferme_name: "Djidjole",
                    city: "Kara",
                    phone_number: "90 90 90 90",
                    update_route: '',
                    delete_route: '',
                  ),
                  FermeCardWidget(
                    ferme_name: "Djidjole",
                    city: "Kara",
                    phone_number: "90 90 90 90",
                    update_route: '',
                    delete_route: '',
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
