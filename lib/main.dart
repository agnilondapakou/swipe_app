import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swipe_app/screens/carte/carte_page.dart';
import 'package:swipe_app/screens/drivers/entreprise/drivers_page.dart';
import 'package:swipe_app/screens/drivers/farmer/farmer_drivers_page.dart';
import 'package:swipe_app/screens/farmers/farmers_page.dart';
import 'package:swipe_app/screens/profile/farmer_profile_page.dart';
import 'package:swipe_app/screens/profile/profile_page.dart';
import 'package:swipe_app/screens/fermes/fermes_pages.dart';
import 'package:swipe_app/screens/home/entreprise/home_page.dart';
import 'package:swipe_app/screens/home/farmers/home_page.dart';
import 'package:swipe_app/screens/login/login_page.dart';
import 'package:swipe_app/screens/notifications/entreprise/notifications_page.dart';
import 'package:swipe_app/screens/notifications/farmer/farmer_notifications_page.dart';
import 'package:swipe_app/screens/orders/entreprise/orders_page.dart';
import 'package:swipe_app/screens/orders/farmers/farmer_orders_page.dart';
import 'package:swipe_app/screens/recoltes/entreprise/recoltes_page.dart';
import 'package:swipe_app/screens/recoltes/farmers/farmer_recoltes_page.dart';
import 'package:swipe_app/screens/register/register.dart';
import 'package:swipe_app/screens/search/search_page.dart';
import 'package:swipe_app/screens/welcome/welcome_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(const MyApp());
  });
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
        // Entreprise's routes
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) =>
            ProfilePage(username: "John Doe", usermail: "john.doe@gmail.com"),
        '/home': (context) => const HomePage(),
        '/orders': (context) => const OrdersPage(),
        '/recoltes': (context) => const RecoltesPage(),
        '/carte': (context) => const CartePage(),
        '/search': (context) => const SearchPage(),
        '/notifications': (context) => const NotificationPage(),
        '/drivers': (context) => const DriversPage(),
        '/farmers': (context) => const FarmersPage(),

        // Famer's routes
        '/register': (context) => const RegisterPage(),
        '/farmers/home': (context) => const FarmersHomePage(),
        '/farmers/orders': (context) => const FermerOrdersPage(),
        '/farmers/recoltes': (context) => const FarmerRecoltesPage(),
        '/farmers/fermes': (context) => const FermePage(),
        '/farmers/drivers': (context) => const FarmerDriversPage(),
        '/farmers/profile': (context) => const FarmerProfilePage(),
        '/farmers/notifications': (context) => const FarmerNotificationPage(),
      },
    );
  }
}
