import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/screens/search/search_page.dart';
import 'package:swipe_app/services/harvest/harvest_service.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../services/order/order_service.dart';

class OrderCardWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String product_name;
  // ignore: non_constant_identifier_names
  final String farm_name;
  final int quantity;
  final String period;
  final String harvest_id;
  // ignore: non_constant_identifier_names
  final String button_text;
  // ignore: non_constant_identifier_names
  final Color bg_color;

  const OrderCardWidget(
      // ignore: non_constant_identifier_names
      {required this.product_name,
      // ignore: non_constant_identifier_names
      required this.farm_name,
      required this.quantity,
      required this.period,
      required this.harvest_id,
      // ignore: non_constant_identifier_names
      required this.button_text,
      // ignore: non_constant_identifier_names
      required this.bg_color,
      super.key});

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  final TextEditingController productQtyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String errorMessage = "";


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> newOrderDialog(BuildContext context) async {
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
                      "Produit : " + widget.product_name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          if(int.parse(productQtyController.text) > widget.quantity){
                            errorMessage = "Quantite disponible : " + widget.quantity.toString();
                            await newOrderDialog(context);
                          }else if(int.parse(productQtyController.text) == 0){
                            errorMessage = "Quantite invalide";
                            await newOrderDialog(context);
                          }else {
                            registerOrder();
                          }
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
                        'Commander',
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
                        // const Icon(
                        //   Icons.info_outline_rounded,
                        //   color: Colors.red,
                        //   size: 15,
                        // ),
                        Text(
                          errorMessage,
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
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: GlobalColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: GlobalColors.primaryColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage(
                  'assets/icons/package.png',
                ),
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produit :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Ferme :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Quantité :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Période :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.product_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    widget.farm_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    widget.quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    widget.period,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 40,
            decoration: BoxDecoration(
              color: widget.bg_color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () async {
                errorMessage = "";
                await newOrderDialog(context);
              },
              child: Text(
                widget.button_text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: GlobalColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatDateRange(String startDate, String endDate) {
    // Format the start date
    DateTime parsedStartDate = DateTime.parse(startDate);
    String formattedStartDate = DateFormat('dd MMMM - ', 'fr_FR').format(parsedStartDate);

    // Format the end date
    DateTime parsedEndDate = DateTime.parse(endDate);
    String formattedEndMonth = DateFormat('dd MMMM', 'fr_FR').format(parsedEndDate).substring(0, 7);
    String formattedEndyear = DateFormat('y', 'fr_FR').format(parsedEndDate);

    // Combine the formatted start date and end date
    String formattedDateRange = ' $formattedStartDate$formattedEndMonth $formattedEndyear';

    return formattedDateRange;
  }

  Future<void> registerOrder() async {
    ApiResponse response = await registerOrderById(
        productQtyController.text.trim(),
        startDateController.text.trim(),
        endDateController.text.trim(),
        widget.harvest_id
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SearchPage()),
          (route) => false,
    );
    getHarvests();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Commande effectuée avec succès!"),
      ),
    );
    print(response.data);
  }
}
