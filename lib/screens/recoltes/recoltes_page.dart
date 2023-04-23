import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/nav_bar_widget.dart';
import '../../widgets/order_card_widget.dart';
import '../../widgets/top_bar_widget.dart';
import '../../widgets/top_icons_widget.dart';

class RecoltesPage extends StatefulWidget {
  const RecoltesPage({super.key});

  @override
  State<RecoltesPage> createState() => _RecoltesPageState();
}

class _RecoltesPageState extends State<RecoltesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Recoltes',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                  header_image: Image.asset('assets/icons/tickbox.png'),
                  desciption: "Visualisez les annonces d'achat",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Column(
                children: [
                  OrderCardWidget(
                    product_name: "Soja",
                    farm_name: "Djidjole",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.primaryColor,
                    button_text: "Annoncer un achat",
                  ),
                  OrderCardWidget(
                    product_name: "Haricot",
                    farm_name: "Alafia",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.primaryColor,
                    button_text: "Annoncer un achat",
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
