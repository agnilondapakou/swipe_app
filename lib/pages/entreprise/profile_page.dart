import 'package:flutter/material.dart';
import 'package:swipe_app/widgets/top_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBarWidget(
        title: 'Swipe App',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
    );
  }
}
