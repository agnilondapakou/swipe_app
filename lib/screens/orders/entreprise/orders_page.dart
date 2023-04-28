import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../../widgets/entreprise/nav_bar_widget.dart';
import '../../../widgets/entreprise/order_card_widget.dart';
import '../../../widgets/entreprise/top_bar_widget.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Commandes',
        sub_title: 'Entreprise',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
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
                    desciption: "Commandes"),
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
                    bg_color: GlobalColors.logoutColor,
                    button_text: "Annuler l'annonce d'achat",
                  ),
                  OrderCardWidget(
                    product_name: "Haricot",
                    farm_name: "Alafia",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.logoutColor,
                    button_text: "Annuler l'annonce d'achat",
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
