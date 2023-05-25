import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swipe_app/services/farm/farm_service.dart';

import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../models/api_response.dart';
import '../../widgets/farmers/farme_card_widget.dart';

class FermePage extends StatefulWidget {
  const FermePage({Key? key}) : super(key: key);

  @override
  State<FermePage> createState() => _FermePageState();
}

class _FermePageState extends State<FermePage> {
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  List<dynamic> farmList = [];
  bool isLoading = true;
  double longitude = 0;
  double latitude = 0;

  Future<void> getFarmInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getFarms();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          farmList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFarmInfo();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> newFarmDialog(BuildContext context) async {
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
                      controller: farmNameController,
                      decoration: InputDecoration(
                        hintText: 'Nom de la ferme',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez le nom de la ferme';
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
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'Ville',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez la ville';
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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          LocationPermission permission =
                          await Geolocator.checkPermission();
                          if (permission == LocationPermission.denied) {
                            permission = await Geolocator.requestPermission();
                            if (permission == LocationPermission.deniedForever) {
                              throw Exception('Location Not Available');
                            }
                          } else {
                            if (permission == LocationPermission.whileInUse ||
                                permission == LocationPermission.always) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: SpinKitChasingDots(
                                      color: Colors.green,
                                      size: 30.0,
                                    ), // Show a loading indicator
                                  );
                                },
                              );

                              try {
                                Position position =
                                await Geolocator.getCurrentPosition();
                                longitude = position.longitude;
                                latitude = position.latitude;
                                Navigator.pop(
                                    context); // Close the loading indicator dialog
                              } catch (e) {
                                Navigator.pop(
                                    context); // Close the loading indicator dialog
                                throw Exception('Error getting location: $e');
                              }
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.navBarItemColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width /
                            4, // Set the desired width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: GlobalColors.primaryColor,
                              size: 20,
                            ),
                            Text(
                              'Ma Position',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: GlobalColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            longitude != null &&
                            latitude != null) {
                          registerFarm();
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
                                  'Veuillez remplir tous les champs et obtenir votre position avant de pouvoir enregistrer.',
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
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          " Veuillez activer la localisation",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 11,
                          ),
                        ),
                      ],
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
        title: 'Fermes',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
          onRefresh: getFarmInfo,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopIconsWidget(
                    header_image: Image.asset(
                      'assets/icons/ferme.png',
                    ),
                    desciption: "Annoncez vos produits prêts à être récoltés",
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
                    await newFarmDialog(context);
                  },
                  child: Text(
                    "Nouvelle ferme",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.whiteColor,
                    ),
                  ),
                ),
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
                    : farmList.isEmpty
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
                      for (var item in farmList)
                        FermeCardWidget(
                          ferme_name: item['farm_name'],
                          city: item['city'],
                          update_route: "farms/${item['id']}",
                          delete_route: "farms/${item['id']}",
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void registerFarm() async {
    ApiResponse response = await registerFarmById(
        farmNameController.text.trim(),
        cityController.text.trim(),
        longitude,
        latitude);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const FermePage()),
      (route) => false,
    );
    getFarmInfo();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Enregistrement effectué avec succès!"),
      ),
    );
    print(response.data);
  }
}
