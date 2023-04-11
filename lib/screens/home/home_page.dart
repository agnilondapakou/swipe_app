import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/nav_bar_widget.dart';
import '../../widgets/top_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Swipe app',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: const NavBarWidget(),
      body: Container(
        color: GlobalColors.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/icons/logoFarmHall.png',
                width: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: Text(
                'Votre application de localisation, de coordination et d\'acheminement des produits agricoles',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'RobotoMono',
                  color: GlobalColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: GlobalColors.primaryColor, width: 3),
                ),
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(Icons.check_circle_outline),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Subtitle',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
