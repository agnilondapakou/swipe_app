import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // ignore: non_constant_identifier_names
  final Icon notification_icon;
  // ignore: non_constant_identifier_names
  final Icon profile_icon;
  // ignore: non_constant_identifier_names
  final String notification_counter;
  const TopBarWidget(
      {super.key,
      required this.title,
      // ignore: non_constant_identifier_names
      required this.notification_icon,
      // ignore: non_constant_identifier_names
      required this.profile_icon,
      required this.notification_counter});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: const Color(0xFF669358),
      actions: [
        //notification button with counter on stack
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              IconButton(
                icon: notification_icon,
                onPressed: () {},
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    // color #F8995E
                    color: Color(0xFFFF7F50),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    notification_counter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),

        IconButton(
          icon: profile_icon,
          onPressed: () {},
        ),
      ],
    );
  }
}
