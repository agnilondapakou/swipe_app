import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

// ignore: must_be_immutable
class NavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  late int selectedIndex = 2;
  NavBarWidget({super.key, required this.selectedIndex});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: 'Commandes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Recherches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          label: 'Carte',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline_outlined),
          label: 'Récoltes',
        ),
      ],
      backgroundColor: GlobalColors.primaryColor,
      unselectedItemColor: GlobalColors.navBarItemColor,
      selectedItemColor: GlobalColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        if (index == 0) {
          Navigator.pushNamed(context, '/orders');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/search');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 3) {
          //print("Map");
        } else if (index == 4) {
          Navigator.pushNamed(context, '/recoltes');
        }
      },
    );
  }

  State<StatefulWidget> createState() => throw UnimplementedError();
}
