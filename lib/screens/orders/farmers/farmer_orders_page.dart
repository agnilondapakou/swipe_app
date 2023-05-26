import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/services/order/order_service.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../../widgets/farmers/order_card_widget.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FermerOrdersPage extends StatefulWidget {
  const FermerOrdersPage({super.key});

  @override
  State<FermerOrdersPage> createState() => _FermerOrdersPageState();
}

class _FermerOrdersPageState extends State<FermerOrdersPage> {
  List<dynamic> orderList = [];
  bool isLoading = true;

  Future<void> getOrderInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getFarmerOrders();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          orderList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getOrderInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Commandes',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                    header_image: Image.asset('assets/icons/orders.png'),
                    desciption:
                        "Retrouvez ici toute les commandes que\n vous avez reçu."),
              ],
            ),
            const SizedBox(height: 15),
            Flexible(
              child: isLoading
                  ? const Center(
                child: SpinKitChasingDots(
                  color: Colors.green,
                  size: 30.0,
                ),
              )
                  : orderList.isEmpty
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/animations/search_empty.json',
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Aucune ferme disponible',
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
                    for (var item in orderList)
                      OrderCardWidget(
                        product_name: item['product_name'],
                        farm_name: item['farm_name'],
                        quantity: item['product_qty'],
                        period: formatDateRange(item["start_date"], item["end_date"]),
                        order_id: item['id'].toString(),
                        bg_color: GlobalColors.primaryColor,
                        button_text: "Assigner la livraison",
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
    String formattedEndMonth = DateFormat('dd MMMM', 'fr_FR').format(parsedEndDate).substring(0, 6);
    String formattedEndyear = DateFormat('y', 'fr_FR').format(parsedEndDate);

    // Combine the formatted start date and end date
    String formattedDateRange = ' $formattedStartDate$formattedEndMonth $formattedEndyear';

    return formattedDateRange;
  }
}
