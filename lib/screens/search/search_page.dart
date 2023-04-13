import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/nav_bar_widget.dart';
import '../../widgets/order_card_widget.dart';
import '../../widgets/top_bar_widget.dart';
import '../../widgets/top_icons_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.secondaryColor,
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Recherches',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 1,
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
                    desciption: "Recherches"),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.search, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Rechercher...",
                              hintStyle: TextStyle(color: GlobalColors.primaryColor),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Cherchez les fermes qui ont les quantites de\nproduits dont vous avez besoins.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderCardWidget(
                      product_name: "Soja",
                      farm_name: "Djidjole",
                      quantity: 5,
                      period: "02-25 Mars 2023",
                      route: '/login',
                      bg_color: GlobalColors.primaryColor,
                    ),
                    OrderCardWidget(
                      product_name: "Haricot",
                      farm_name: "Alafia",
                      quantity: 5,
                      period: "02-25 Mars 2023",
                      route: '/login',
                      bg_color: GlobalColors.primaryColor,
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
}
