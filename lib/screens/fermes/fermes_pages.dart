import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/services/farm/farm_service.dart';

import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../models/api_response.dart';
import '../../widgets/farmers/farme_card_widget.dart';

class FermePage extends StatefulWidget {
  const FermePage({super.key});

  @override
  State<FermePage> createState() => _FermePageState();
}

class _FermePageState extends State<FermePage> {
  List<dynamic> farmList = [];
  bool isLoading = true;
  void getFarmInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getFarms();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          farmList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFarmInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
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
                    'assets/icons/ferme.png',
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
              child: isLoading
                  ? const Center(
                      child: SpinKitChasingDots(
                        color: Colors.green,
                        size: 30.0,
                      ),
                    )
                  : Column(
                      children: [
                        for (var item in farmList)
                          FermeCardWidget(
                            ferme_name: item['farm_name'],
                            city: item['city'],
                            update_route: '',
                            delete_route: '',
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
