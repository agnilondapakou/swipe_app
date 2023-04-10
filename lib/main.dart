import 'package:flutter/material.dart';
import 'package:swipe_app/screens/entreprise/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe App',
      home: ProfilePage(
        username: "John Doe",
        usermail: "john.doe@gmail.com",
      ),
    );
  }
}
