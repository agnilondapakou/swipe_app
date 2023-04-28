import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';
import '../../../widgets/nav_bar_widget.dart';
import '../../../widgets/top_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Open Farm',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Votre application de localisation,de coordination et d'acheminement des produits agricoles.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: GlobalColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/recoltes');
                    },
                    title: 'Récoltes',
                    description: 'Afficher les produits prêts à être récoltés.',
                    imagePath: 'assets/icons/tickbox.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      // Function to execute on tap
                    },
                    title: 'Carte des fermes',
                    description: 'Trouver les fermes les plus proches.',
                    imagePath: 'assets/icons/map.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    title: 'Recherche',
                    description:
                        'Trouver des fermes avec la quantité de produit dont vous avez besoin.',
                    imagePath: 'assets/icons/search.png',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: CustomCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    title: 'Commandes',
                    description: 'Suivez vos commandes.',
                    imagePath: 'assets/icons/orders.png',
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
