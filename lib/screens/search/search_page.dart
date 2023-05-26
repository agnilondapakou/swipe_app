import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/services/search/search_service.dart';

import '../../utils/constants.dart';
import '../../widgets/entreprise/nav_bar_widget.dart';
import '../../widgets/entreprise/order_card_widget.dart';
import '../../widgets/entreprise/top_bar_widget.dart';
import '../../widgets/entreprise/top_icons_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController wordController = TextEditingController();
  List<dynamic> harvestList = [];
  bool isLoading = true;

  Future<void> getHarvestInfo() async {
    setState(() {
      isLoading = true;
    });
    ApiResponse response = await searchHarvests(
        wordController.text.trim()
    );

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
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Recherches',
        sub_title: 'Entreprise',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: 0,
      ),
      bottomNavigationBar: NavBarWidget(
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
                    header_image: Image.asset('assets/icons/search.png'),
                    desciption:
                        "Cherchez les fermes qui ont les quantites de\nproduits dont vous avez besoins."),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: GlobalColors.tertiaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: GlobalColors.primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              getHarvestInfo();
                              // print(wordController.text);
                            },
                            child: const Icon(Icons.search, color: Colors.white),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => GlobalColors.primaryColor)
                            ),
                          )
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: wordController,
                            decoration: InputDecoration(
                              hintText: "Rechercher...",
                              hintStyle: GoogleFonts.poppins(
                                  color: GlobalColors.primaryColor),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.poppins(
                              color: GlobalColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                      OrderCardWidget(
                        product_name: item["product_name"],
                        farm_name: item["farm_name"],
                        quantity: item["product_qty"],
                        period: formatDateRange(item["start_date"], item["end_date"]),
                        route: '/login',
                        bg_color: GlobalColors.primaryColor,
                        button_text: "Annoncer un achat",
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

  String formatDateRange(String startDate, String endDate) {
    // Format the start date
    DateTime parsedStartDate = DateTime.parse(startDate);
    String formattedStartDate = DateFormat('dd MMMM - ', 'fr_FR').format(parsedStartDate);

    // Format the end date
    DateTime parsedEndDate = DateTime.parse(endDate);
    String formattedEndMonth = DateFormat('dd MMMM', 'fr_FR').format(parsedEndDate).substring(0, 7);
    String formattedEndyear = DateFormat('y', 'fr_FR').format(parsedEndDate);

    // Combine the formatted start date and end date
    String formattedDateRange = ' $formattedStartDate$formattedEndMonth $formattedEndyear';

    return formattedDateRange;
  }
}
