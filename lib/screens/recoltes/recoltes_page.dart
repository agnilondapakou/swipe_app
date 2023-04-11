import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/order_card_widget.dart';
import 'package:swipe_app/widgets/top_icons_widget.dart';

import '../../widgets/nav_bar_widget.dart';
import '../../widgets/top_bar_widget.dart';

class RecoltesPage extends StatefulWidget {
  const RecoltesPage({super.key});

  @override
  State<RecoltesPage> createState() => _RecoltesPageState();
}

class _RecoltesPageState extends State<RecoltesPage> {
  final int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.secondaryColor,
      appBar: const TopBarWidget(
        title: 'Recoltes',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 2,
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
                  desciption: "Visualisez les recoltes disponibles",
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
                    bg_color: GlobalColors.logoutColor,
                  ),
                  OrderCardWidget(
                    product_name: "Haricot",
                    farm_name: "Alafia",
                    quantity: 5,
                    period: "02-25 Mars 2023",
                    route: '/login',
                    bg_color: GlobalColors.logoutColor,
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
