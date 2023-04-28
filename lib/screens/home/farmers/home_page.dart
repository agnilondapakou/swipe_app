import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FarmersHomePage extends StatelessWidget {
  const FarmersHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmeTopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Open Farm',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    Text(
                      "Agriculteurs mettez a disposition de l'entreprise OPEN vos produits agricoles.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/farmers/home');
                    },
                    title: 'Récoltes',
                    description: 'Announcez vos produits prêts à être récoltés',
                    imagePath: 'assets/icons/tickbox.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/farmers/home');
                    },
                    title: 'Mes Fermes',
                    description: 'Ajouter et gerez vos fermes.',
                    imagePath: 'assets/icons/map.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/farmers/orders');
                    },
                    title: 'Commandes',
                    description: 'Suivez les commandes de l\'entreprise OPEN.',
                    imagePath: 'assets/icons/orders.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/farmers/home');
                    },
                    title: 'Livreures',
                    description:
                        'Gerez vos livreures et assignez les à des commandes.',
                    imagePath: 'assets/icons/delivery.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final String imagePath;

  const CustomCardWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: GlobalColors.primaryColor, width: 2),
        ),
        child: Card(
          color: GlobalColors.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  imagePath,
                  width: 48,
                  height: 48,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: GlobalColors.primaryColor,
                        ),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: GlobalColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
