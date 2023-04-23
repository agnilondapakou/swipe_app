import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/nav_bar_widget.dart';
import 'package:swipe_app/widgets/notification_widget.dart';
import 'package:swipe_app/widgets/top_bar_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBarWidget(
          title: "Notifications",
          automaticallyImplyLeading: true,
          notification_icon: Icon(Icons.notifications),
          profile_icon: Icon(Icons.person_outline_rounded),
          notification_counter: "0",
        ),
        bottomNavigationBar: NavBarWidget(selectedIndex: 2),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
