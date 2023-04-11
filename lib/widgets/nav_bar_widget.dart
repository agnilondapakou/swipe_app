import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

// ignore: must_be_immutable
class NavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  late int selectedIndex = 0;
  NavBarWidget({required this.selectedIndex, Key? key});
  
  @override
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
        selectedIndex = index;
        if (index == 0) {
          Navigator.pushNamed(context, '/orders');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/recoltes');
        }
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
