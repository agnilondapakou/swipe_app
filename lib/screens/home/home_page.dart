import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/nav_bar_widget.dart';
import '../../widgets/top_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.secondaryColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Swipe app',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/icons/logoFarmHall.png'),
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Votre application de localisation, de coordination et d\'acheminement des produits agricoles',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: GlobalColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/recoltes');
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: GlobalColors.primaryColor, width: 3),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              'assets/icons/tickbox.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Récoltes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RobotoMono',
                                      color: GlobalColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Afficher les produits prêts à être récoltés.',
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/carte');
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: GlobalColors.primaryColor, width: 3),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              'assets/icons/map.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Carte des fermes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RobotoMono',
                                      color: GlobalColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Trouver les fermes les plus proches.',
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    // Function to execute on tap
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: GlobalColors.primaryColor, width: 3),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              'assets/icons/search.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Recherche',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RobotoMono',
                                      color: GlobalColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Trouver des fermes avec la quantité de produit dont vous avez besoin.',
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/orders');
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: GlobalColors.primaryColor, width: 3),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              'assets/icons/orders.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Commandes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RobotoMono',
                                      color: GlobalColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Suivez vos commandes.',
                                    style: TextStyle(
                                      fontSize: 12,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
