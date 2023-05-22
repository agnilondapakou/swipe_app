import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/services/farm/farm_service.dart';

import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';
import '../../models/api_response.dart';
import '../../widgets/farmers/farme_card_widget.dart';

class FermePage extends StatefulWidget {
  const FermePage({super.key});

  @override
  State<FermePage> createState() => _FermePageState();
}

class _FermePageState extends State<FermePage> {
  List<dynamic> farmList = [];
  bool isLoading = true;
  void getFarmInfo() async {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState> ();

  Future<void> newFarmDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context) {
          final TextEditingController productNameController = TextEditingController();
          final TextEditingController quantityController = TextEditingController();

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Novelle ferme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: productNameController,
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
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: quantityController,
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
                          fontSize: 15 // set the text color
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () async {
                        // submit form
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
            );
          });
        }
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopIconsWidget(
                  header_image: Image.asset(
                    'assets/icons/ferme.png',
                  ),
                  desciption: "Annocez vos produits prêts à être récoltés",
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
            Flexible(
              child: isLoading
                  ? const Center(
                      child: SpinKitChasingDots(
                        color: Colors.green,
                        size: 30.0,
                      ),
                    )
                  : SingleChildScrollView(
                    child: Column(
                        children: [
                          for (var item in farmList)
                            FermeCardWidget(
                              ferme_name: item['farm_name'],
                              city: item['city'],
                              update_route: '',
                              delete_route: "farms/${item['id']}",
                            ),
                        ],
                      ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
