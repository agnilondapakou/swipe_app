import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/screens/notifications/entreprise/notification_details.dart';
import 'package:swipe_app/utils/constants.dart';

import 'custom_rext_tween.dart';

class NotificationWidget extends StatelessWidget {
  final String message;
  final String date;
  final String route;
  final Color activeColor;
  final String notificationTitle;
  final String notificationBody;

  const NotificationWidget({
    super.key,
    required this.message,
    required this.date,
    required this.route,
    required this.activeColor,
    required this.notificationTitle,
    required this.notificationBody,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: GlobalColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(194, 0, 0, 0).withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.circle_notifications_rounded,
              color: activeColor,
              size: 30.0,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: GlobalColors.textColor,
                fontSize: 13.0,
              ),
            ),
            Text(
              date,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: GlobalColors.textColor,
                fontSize: 9.0,
              ),
            ),
            // Icon(
            //   Icons.circle,
            //   color: activeColor,
            //   size: 10.0,
            // ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) {
              return _AddNotificationDialog(
                  title: notificationTitle, body: notificationBody);
            },
          ),
        );
      },
    );
  }
}

const String _heroAddTodo = 'add-todo-hero';

class _AddNotificationDialog extends StatelessWidget {
  final String title;
  final String body;
  const _AddNotificationDialog(
      {Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween();
          },
          child: Material(
            color: GlobalColors.whiteColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      body,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
