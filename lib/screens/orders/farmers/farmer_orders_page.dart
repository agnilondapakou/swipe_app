import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../../widgets/entreprise/order_card_widget.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FermerOrdersPage extends StatefulWidget {
  const FermerOrdersPage({super.key});

  @override
  State<FermerOrdersPage> createState() => _FermerOrdersPageState();
}

class _FermerOrdersPageState extends State<FermerOrdersPage> {
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
              child: Column(
                children: [
                  OrderCardWidget(
                    product_name: "Soja",
                    farm_name: "Djidjole",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    harvest_id: "",
                    delete: false,
                    order_id: "",
                    bg_color: GlobalColors.primaryColor,
                    button_text: "Lancer la livraison",
                  ),
                  OrderCardWidget(
                    product_name: "Haricot",
                    farm_name: "Alafia",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    harvest_id: "",
                    delete: false,
                    order_id: "",
                    bg_color: GlobalColors.primaryColor,
                    button_text: "Lancer la livraison",
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
