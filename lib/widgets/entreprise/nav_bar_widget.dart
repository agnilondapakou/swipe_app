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
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: 'Commandes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          label: 'Fermes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Recherches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_1),
          label: 'Agriculteurs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.drive_eta_outlined),
          label: 'Livreurs',
        ),
      ],
      backgroundColor: GlobalColors.primaryColor,
      unselectedItemColor: GlobalColors.whiteColor,
      selectedItemColor: GlobalColors.notificationColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/orders');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/carte');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/search');
        } else if (index == 4) {
          Navigator.pushNamed(context, '/recoltes');
        } else if (index == 5) {
          Navigator.pushNamed(context, '/recoltes');
        } else if (index == 6) {
          Navigator.pushNamed(context, '/recoltes');
        }
      },
    );
  }

  State<StatefulWidget> createState() => throw UnimplementedError();
}
