import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState> ();
  DateTime _selectedDate = DateTime.now();

  Future<void> newRecolteDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context) {
          final TextEditingController productNameController = TextEditingController();
          final TextEditingController qantityController = TextEditingController();
          TextEditingController startDateController = TextEditingController();
          final TextEditingController endDateController = TextEditingController();

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nouvelle recolte",
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
                        hintText: 'Nom du produit',
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
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: qantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Quantite en tonnes',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez la quantite';
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(
                          color: GlobalColors.textColor,
                          fontSize: 15 // set the text color
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: startDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: startDateController.text,
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2100)
                        );
                        // startDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez choisir une date';
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(
                          color: GlobalColors.textColor,
                          fontSize: 15 // set the text color
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: startDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: startDateController.text,
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2100)
                        );
                        // startDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez choisir une date';
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
                  ],
                ),
              ),
            );

          });
        }
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
                  await newRecolteDialog(context);
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
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FarmerRecolteCardWidget(
                      product_name: "Soja",
                      farm_name: "Djidjole",
                      quantity: 5,
                      period: "02-25 Mars 2023",
                      delete_route: '',
                      update_route: '',
                      bg_color: GlobalColors.logoutColor,
                      button_text: "Retirer l'annonce",
                    ),
                    FarmerRecolteCardWidget(
                      product_name: "Haricot",
                      farm_name: "Djidjole",
                      quantity: 5,
                      period: "02-25 Mars 2023",
                      delete_route: '',
                      update_route: '',
                      bg_color: GlobalColors.logoutColor,
                      button_text: "Retirer l'annonce",
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
}
