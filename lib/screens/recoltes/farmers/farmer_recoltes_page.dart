import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/services/harvest/harvest_service.dart';

import '../../../models/api_response.dart';
import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_recolte_card_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FarmerRecoltesPage extends StatefulWidget {
  const FarmerRecoltesPage({super.key});

  @override
  State<FarmerRecoltesPage> createState() => _FarmerRecoltesPageState();
}

class _FarmerRecoltesPageState extends State<FarmerRecoltesPage> {
  List<dynamic> harvestList = [];
  bool isLoading = true;
  Future<void> getHarvestInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getHarvests();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          harvestList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getHarvestInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
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
        child: RefreshIndicator(
          onRefresh: getHarvestInfo,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopIconsWidget(
                    header_image: Image.asset(
                      'assets/icons/tree.png',
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
                    "Nouvelle recolte",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: isLoading
                    ? const Center(
                  child: SpinKitChasingDots(
                    color: Colors.green,
                    size: 30.0,
                  ),
                )
                    : harvestList.isEmpty
                    ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/animations/search_empty.json',
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Aucune récolte disponible',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: GlobalColors.textColor,
                        ),
                      ),
                    ],
                  ),
                )
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var item in harvestList)
                        FarmerRecolteCardWidget(
                          product_name: item["product_name"],
                          farm_name: "Djidjole",
                          quantity: item["product_qty"],
                          period: "02-25 Mars 2023",
                          delete_route: '',
                          update_route: '',
                          bg_color: GlobalColors.logoutColor,
                          button_text: "Retirer l'annonce",
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
