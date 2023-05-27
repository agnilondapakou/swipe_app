import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/models/api_response.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/entreprise/top_icons_widget.dart';
import '../../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../../services/deliver/deliver_service.dart';
import '../../../widgets/farmers/farmer_driver_card_widget.dart';

class FarmerDriversPage extends StatefulWidget {
  const FarmerDriversPage({super.key});

  @override
  State<FarmerDriversPage> createState() => _FarmerDriversPageState();
}

class _FarmerDriversPageState extends State<FarmerDriversPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  List<dynamic> deliverList = [];
  bool isLoading = true;


  Future<void> getDeliversInfo() async {
    setState(() {
      isLoading = true;
    });
    ApiResponse response = await getDelivers();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          deliverList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getDeliversInfo();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> newDriverDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nouvelle ferme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Nom du livreur',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez le nom du livreur';
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: contactController,
                      decoration: InputDecoration(
                        hintText: 'Email ou Telephone',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez l\'email ou le telephone';
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          registerDriver();
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Erreur',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  'Veuillez remplir tous les champs avant de pouvoir enregistrer.',
                                  style: GoogleFonts.poppins(),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: GlobalColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(double.infinity, 55),
                      ),
                      child: Text(
                        'Enregistrer',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: const FarmerTopBarWidget(
        automaticallyImplyLeading: false,
        title: 'Livreurs',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                  header_image: Image.asset(
                    'assets/icons/delivery.png',
                  ),
                  desciption:
                      "Enregistrez vos livreurs et assignez-leur\n des commandes",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 200,
              height: 40,
              decoration: BoxDecoration(
                color: GlobalColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async {
                  await newDriverDialog(context);
                },
                child: Text(
                  "Nouveau Livreur",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: GlobalColors.whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: isLoading
                  ? const Center(
                child: SpinKitChasingDots(
                  color: Colors.green,
                  size: 30.0,
                ),
              )
                  : deliverList.isEmpty
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/animations/search_empty.json',
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Aucune ferme disponible',
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
                    for (var item in deliverList)
                      FarmerDriverCardWidget(
                        driver_username: item['username'],
                        driver_contact: item['userinfo'],
                        delete_route: '',
                        update_route: '',
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerDriver() async {
    ApiResponse response = await createDeliver(
        usernameController.text.trim(),
        contactController.text.trim(),
        "1"
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const FarmerDriversPage()),
          (route) => false,
    );
    getDeliversInfo();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Enregistrement effectué avec succès!"),
      ),
    );
    print(response.data);
  }
}
