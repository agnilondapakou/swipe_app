import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

class NotificationWidget extends StatelessWidget {
  final String message;
  final String route;
  final Color activeColor;

  const NotificationWidget({
    super.key,
    required this.message,
    required this.route,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: GlobalColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: GlobalColors.primaryColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.circle_notifications_rounded,
              color: GlobalColors.tertiaryColor,
              size: 30.0,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.circle,
              color: activeColor,
              size: 12.0,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
