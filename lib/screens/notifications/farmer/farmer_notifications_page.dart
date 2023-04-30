import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/entreprise/nav_bar_widget.dart';
import 'package:swipe_app/widgets/entreprise/top_icons_widget.dart';

import '../../../widgets/entreprise/notification_widget.dart';
import '../../../widgets/entreprise/top_bar_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FarmerNotificationPage extends StatefulWidget {
  const FarmerNotificationPage({super.key});

  @override
  State<FarmerNotificationPage> createState() => _FarmerNotificationPageState();
}

class _FarmerNotificationPageState extends State<FarmerNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const FarmerTopBarWidget(
          title: "Notifications",
          sub_title: 'Agriculteur',
          automaticallyImplyLeading: true,
          notification_icon: Icon(Icons.notifications),
          profile_icon: Icon(Icons.person_outline_rounded),
          notification_counter: "0",
        ),
        bottomNavigationBar: FarmerNavBarWidget(selectedIndex: 2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TopIconsWidget(
                header_image: Image.asset('assets/icons/notification.png'),
                desciption: "Consultez vos notifications",
              ),
              const SizedBox(height: 10),
              NotificationWidget(
                message: "Nouvelle recolte en vue...",
                route: '/notifications',
                activeColor: GlobalColors.logoutColor,
                notificationTitle: 'Nouvelle recolte en vue...',
                notificationBody:
                    'lorem ipsum dolore sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              ),
              NotificationWidget(
                message: "Nouvelle recolte en vue...",
                route: '/notifications',
                activeColor: GlobalColors.logoutColor,
                notificationTitle: 'Nouvelle recolte en vue...',
                notificationBody:
                    'lorem ipsum dolore sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              ),
              NotificationWidget(
                message: "Nouvelle recolte en vue...",
                route: '/notifications',
                activeColor: GlobalColors.textColor,
                notificationTitle: 'Nouvelle recolte en vue...',
                notificationBody:
                    'lorem ipsum dolore sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              ),
              NotificationWidget(
                message: "Nouvelle recolte en vue...",
                route: '/notifications',
                activeColor: GlobalColors.textColor,
                notificationTitle: 'Nouvelle recolte en vue...',
                notificationBody:
                    'lorem ipsum dolore sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              ),
            ],
          ),
        ));
  }
}
