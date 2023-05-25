import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_app/services/harvest/harvest_service.dart';

import '../../../models/api_response.dart';
import '../../../utils/constants.dart';
import '../../../widgets/entreprise/top_icons_widget.dart';
import '../../../widgets/farmers/farmer_nav_bar_widget.dart';
import '../../../widgets/farmers/farmer_recolte_card_widget.dart';
import '../../../widgets/farmers/farmer_top_bar_widget.dart';

class FarmerRecoltesPage extends StatefulWidget {
  const FarmerRecoltesPage({super.key});

  @override
  State<FarmerRecoltesPage> createState() => _FarmerRecoltesPageState();
}

class _FarmerRecoltesPageState extends State<FarmerRecoltesPage> {
  String? selectedFarmName;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productQtyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<dynamic> harvestList = [];
  bool isLoading = true;
  Future<void> getHarvestInfo() async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await getHarvests();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          harvestList = List<dynamic>.from(info as List<dynamic>);
        }
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getHarvestInfo();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> newHarvestDialog(BuildContext context) async {
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
                      "Nouvelle récolte",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedFarmName,
                      onChanged: (value) {
                        setState(() {
                          selectedFarmName = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Sélectionnez une ferme',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'ferme1',
                          child: Text('Ferme 1'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'ferme2',
                          child: Text('Ferme 2'),
                        ),
                        // Add more DropdownMenuItem as needed
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sélectionnez une ferme';
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: productNameController,
                      decoration: InputDecoration(
                        hintText: 'Libellé produit',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez le nom du produit';
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
                      controller: productQtyController,
                      decoration: InputDecoration(
                        hintText: 'Quantité',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez la quantité';
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
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.fromSwatch(
                                  primarySwatch: MaterialColor(
                                    GlobalColors.primaryColor.value,
                                    <int, Color>{
                                      50: GlobalColors.primaryColor,
                                      100: GlobalColors.primaryColor,
                                      200: GlobalColors.primaryColor,
                                      300: GlobalColors.primaryColor,
                                      400: GlobalColors.primaryColor,
                                      500: GlobalColors.primaryColor,
                                      600: GlobalColors.primaryColor,
                                      700: GlobalColors.primaryColor,
                                      800: GlobalColors.primaryColor,
                                      900: GlobalColors.primaryColor,
                                    },
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                            startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                          });
                        }
                      },
                      controller: startDateController,
                      decoration: InputDecoration(
                        hintText: 'Date début',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sélectionnez la date début';
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
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.fromSwatch(
                                  primarySwatch: MaterialColor(
                                    GlobalColors.primaryColor.value,
                                    <int, Color>{
                                      50: GlobalColors.primaryColor,
                                      100: GlobalColors.primaryColor,
                                      200: GlobalColors.primaryColor,
                                      300: GlobalColors.primaryColor,
                                      400: GlobalColors.primaryColor,
                                      500: GlobalColors.primaryColor,
                                      600: GlobalColors.primaryColor,
                                      700: GlobalColors.primaryColor,
                                      800: GlobalColors.primaryColor,
                                      900: GlobalColors.primaryColor,
                                    },
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                            endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                          });
                        }
                      },
                      controller: endDateController,
                      decoration: InputDecoration(
                        hintText: 'Date fin',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sélectionnez la date de fin';
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
                          " Veuillez remplir tous les champs",
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
        title: 'Recoltes',
        sub_title: 'Agriculteur',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: '0',
      ),
      bottomNavigationBar: FarmerNavBarWidget(
        selectedIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
          onRefresh: getHarvestInfo,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopIconsWidget(
                    header_image: Image.asset(
                      'assets/icons/tree.png',
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
                    await newHarvestDialog(context);
                  },
                  child: Text(
                    "Nouvelle recolte",
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
                    : harvestList.isEmpty
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
                      for (var item in harvestList)
                        FarmerRecolteCardWidget(
                          product_name: item["product_name"],
                          farm_name: item["farm_name"],
                          quantity: item["product_qty"],
                          period: formatDateRange(item["start_date"], item["end_date"]),
                          delete_route: "harvests/${item['id']}",
                          update_route: "harvests/${item['id']}",
                          bg_color: GlobalColors.logoutColor,
                          button_text: "Retirer l'annonce",
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

  String formatDateRange(String startDate, String endDate) {
    // Format the start date
    DateTime parsedStartDate = DateTime.parse(startDate);
    String formattedStartDate = DateFormat('dd-').format(parsedStartDate);

    // Format the end date
    DateTime parsedEndDate = DateTime.parse(endDate);
    String formattedEndDate = DateFormat('dd MMMM y').format(parsedEndDate);

    // Combine the formatted start date and end date
    String formattedDateRange = '$formattedStartDate$formattedEndDate';

    return formattedDateRange;
  }


}