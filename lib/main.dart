import 'package:flutter/material.dart';
import 'package:swipe_app/screens/entreprise/profile_page.dart';
import 'package:swipe_app/screens/home/home_page.dart';
import 'package:swipe_app/screens/login/login_page.dart';
import 'package:swipe_app/screens/orders/orders_page.dart';
import 'package:swipe_app/screens/recoltes/recoltes_page.dart';
import 'package:swipe_app/screens/search/search_page.dart';
import 'package:swipe_app/screens/welcome/welcome_page.dart';

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
      home: const WelcomePage(),
      initialRoute: '/',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) =>
            ProfilePage(username: "John Doe", usermail: "john.doe@gmail.com"),
        '/home': (context) => const HomePage(),
        '/orders': (context) => const OrdersPage(),
        '/recoltes': (context) => const RecoltesPage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}
