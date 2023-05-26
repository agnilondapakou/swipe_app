import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/screens/orders/entreprise/orders_page.dart';
import 'package:swipe_app/screens/search/search_page.dart';
import 'package:swipe_app/services/deliver/deliver_service.dart';
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
  final String order_id;
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
        required this.order_id,
      // ignore: non_constant_identifier_names
      required this.button_text,
      // ignore: non_constant_identifier_names
      required this.bg_color,
      super.key});

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  String? selectedDeliverName;
  final TextEditingController productQtyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String errorMessage = "";
  List<dynamic> deliverList = [];
  bool isLoading = true;


  Future<void> getDeliversInfo() async {
    ApiResponse response = await getDelivers();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          deliverList = List<dynamic>.from(info as List<dynamic>);
        }
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getDeliversInfo();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> deliveryDialog(BuildContext context) async {
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
                      "Produit : ${widget.product_name}; Qte : ${widget.quantity} tonne(s)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedDeliverName,
                      onChanged: (value) {
                        setState(() {
                          selectedDeliverName = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Sélectionnez un livreur',
                        filled: true,
                        fillColor: GlobalColors.tertiaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: deliverList.map<DropdownMenuItem<String>>((dynamic item) {
                        final userName = item['username'] as String;
                        final userId = item['id'].toString();
                        return DropdownMenuItem<String>(
                          value: userId,
                          child: Text(userName),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sélectionnez un livreur';
                        } else{
                          print(value);
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
                        'Assigner',
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
                await deliveryDialog(context);
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
}
