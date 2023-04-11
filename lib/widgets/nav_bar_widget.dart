import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

// ignore: must_be_immutable
class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: GlobalColors.primaryColor,
      unselectedItemColor: GlobalColors.navBarItemColor,
      selectedItemColor: GlobalColors.whiteColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: 'Commandes',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.search_outlined),
        //   label: 'Recherche',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.pin_drop_rounded),
        //   label: 'Carte',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline_outlined),
          label: 'Recoltes',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          if (index == 0) {
            Navigator.pushNamed(context, '/orders');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/home');
          }
        });
      },
    );
  }
}
