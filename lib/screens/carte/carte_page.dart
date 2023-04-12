import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipe_app/widgets/nav_bar_widget.dart';
import 'package:swipe_app/widgets/top_bar_widget.dart';

class CartePage extends StatefulWidget {
  const CartePage({super.key});

  @override
  State<CartePage> createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBarWidget(
          automaticallyImplyLeading: true,
          title: 'Carte',
          notification_icon: Icon(Icons.notifications_outlined),
          profile_icon: Icon(Icons.person_outline_rounded),
          notification_counter: '0',
        ),
        bottomNavigationBar: NavBarWidget(
          selectedIndex: 3,
        ),
        body: Center(
          child: Image.asset('assets/icons/mapcard.png'),
        ));
  }
}
