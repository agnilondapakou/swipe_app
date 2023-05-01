import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/entreprise/driver_card_widget.dart';
import '../../../widgets/entreprise/nav_bar_widget.dart';
import '../../../widgets/entreprise/top_bar_widget.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
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
        selectedIndex: 5,
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
                    DriverCardWidget(
                      driver_first_name: "DHL",
                      driver_last_name: "-",
                      delivery_count: 5,
                      driver_email: "dr@gmail.com",
                      driver_phone_number: "90 90 90 90",
                      delete_route: '',
                      update_route: '',
                    ),
                    DriverCardWidget(
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
