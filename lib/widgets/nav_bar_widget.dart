import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 1;

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
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline_outlined),
          label: 'Récoltes',
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
