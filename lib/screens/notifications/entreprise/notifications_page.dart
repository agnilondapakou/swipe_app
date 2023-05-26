import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/services/notifications/recoltes_notif_service.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:swipe_app/widgets/entreprise/nav_bar_widget.dart';

import '../../../widgets/entreprise/notification_widget.dart';
import '../../../widgets/entreprise/top_bar_widget.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<dynamic> readNotificationsList = [];
  List<dynamic> notReadNotificationsList = [];
  int notifCount = 0;
  bool isLoading = true;
  Future<void> getNotifsInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse notReadResponse = await getHarvestsNotReadNotifs();
    ApiResponse readResponse = await getHarvestsReadNotif();
    if (notReadResponse.data != null) {
      setState(() {
        final notReadInfo = notReadResponse.data;
        if (notReadInfo != null) {
          notReadNotificationsList = List<dynamic>.from(notReadInfo as List<dynamic>);
          notifCount = notReadNotificationsList.length;
        }
        isLoading = false;
      });
    }
    if (readResponse.data != null) {
      setState(() {
        final readInfo = readResponse.data;
        if (readInfo != null) {
          readNotificationsList = List<dynamic>.from(readInfo as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }

  Color readOrNot(notifStatus) {
    Color tickColor = GlobalColors.logoutColor;
    if(notifStatus == 0) {
      tickColor = GlobalColors.notificationColor;
    }else if(notifStatus == 1) {
      tickColor = GlobalColors.textColor;
    }
    return tickColor;
  }

  @override
  void initState() {
    super.initState();
    getNotifsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBarWidget(
          title: "Notifications",
          sub_title: 'Entreprise',
          automaticallyImplyLeading: true,
          notification_icon: Icon(Icons.notifications),
          profile_icon: Icon(Icons.person_outline_rounded),
          notification_counter: int.parse(notifCount.toString()),
        ),
        bottomNavigationBar: NavBarWidget(selectedIndex: 0),
        body: Column(
          children: [
            const SizedBox(height: 10),
            TopIconsWidget(
              header_image: Image.asset('assets/icons/notification.png'),
              desciption: "Consultez vos notifications",
            ),
            const SizedBox(height: 10),
            Expanded(
              child: isLoading
                  ? const Center(
                child: SpinKitChasingDots(
                  color: Colors.green,
                  size: 30.0,
                ),
              )
                  : notReadNotificationsList.isEmpty || readNotificationsList.isEmpty
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/animations/search_empty.json',
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Aucune récolte disponible',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ],
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    for (var item in notReadNotificationsList)
                      NotificationWidget(
                        message: item['notif_title'] + "...",
                        route: '/notifications/${item['id']}',
                        activeColor: readOrNot(item['notif_status']),
                        notificationTitle: item['notif_title'],
                        notificationBody: item['notif_message'],
                        date: formatDateRange(item['notif_date']),
                      ),
                    for (var item1 in readNotificationsList)
                      NotificationWidget(
                        message: item1['notif_title'] + "...",
                        route: '/notifications',
                        activeColor: readOrNot(item1['notif_status']),
                        notificationTitle: item1['notif_title'],
                        notificationBody: item1['notif_message'],
                        date: formatDateRange(item1['notif_date']),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  String formatDateRange(String notifDate) {
    DateTime parsedNotifDate = DateTime.parse(notifDate);
    String formattedMonth = DateFormat('dd MMMM', 'fr_FR').format(parsedNotifDate).substring(0, 6);
    String formattedEndyear = DateFormat('y', 'fr_FR').format(parsedNotifDate);
    String formattedDateRange = ' $formattedMonth $formattedEndyear';

    return formattedDateRange;
  }
}
