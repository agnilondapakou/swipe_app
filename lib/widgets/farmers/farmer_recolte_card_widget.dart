import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:swipe_app/services/harvest/harvest_service.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../models/api_response.dart';
import '../../screens/recoltes/farmers/farmer_recoltes_page.dart';
import '../../services/farm/farm_service.dart';

class FarmerRecolteCardWidget extends StatefulWidget {
  final String product_name;
  final String farm_name;
  final int quantity;
  final String period;
  final String delete_route;
  final String update_route;
  final String button_text;
  final Color bg_color;

  const FarmerRecolteCardWidget({
    required this.product_name,
    required this.farm_name,
    required this.quantity,
    required this.period,
    required this.delete_route,
    required this.update_route,
    required this.button_text,
    required this.bg_color,
    Key? key,
  }) : super(key: key);

  @override
  _FarmerRecolteCardWidgetState createState() => _FarmerRecolteCardWidgetState();
}

class _FarmerRecolteCardWidgetState extends State<FarmerRecolteCardWidget> {
  String? selectedFarmName;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<dynamic> farmList = [];
  var info;
  void deleteHarvest(String type) async {
    ApiResponse response = await deleteHarvestById(type);
    if (response.data != null) {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FarmerRecoltesPage()),
              (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Récolte supprimée avec succès"),
          ),
        );
      });
    }
  }

  void showConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.SCALE,
      title: 'Confirmation',
      desc: 'Êtes-vous sûr de vouloir supprimer cette récolte ?',
      btnCancelText: 'Annuler',
      btnCancelColor:
      GlobalColors.primaryColor, // Change the cancel button color
      btnOkText: 'Supprimer',
      btnOkColor: GlobalColors.logoutColor, // Change the delete button color
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        deleteHarvest(widget.delete_route);
      },
    ).show();
  }

  @override
  void initState() {
    super.initState();
    getFarmInfo();
  }
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
                image: AssetImage('assets/icons/tree.png'),
                width: 100,
                height: 100,
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: GlobalColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: GlobalColors.whiteColor,
                      ),
                      TextButton(
                        onPressed: () {
                          getHarvest(widget.update_route);
                        },
                        child: Text(
                          'Modifier',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: GlobalColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: GlobalColors.logoutColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: GlobalColors.whiteColor,
                      ),
                      TextButton(
                        onPressed: () {
                          showConfirmationDialog();
                        },
                        child: Text(
                          'Supprimer',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: GlobalColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getFarmInfo() async {
    ApiResponse response = await getFarms();
    if (response.data != null) {
      setState(() {
        final info = response.data;
        if (info != null) {
          farmList = List<dynamic>.from(info as List<dynamic>);
        }
      });
    }
  }

  Future<void> getHarvest(String type) async {
    ApiResponse response = await getHarvestById(type);
    if (response.data != null) {
      setState(() {
        info = response.data;
        updateHarvestDialog(context, info);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Chargement échoué!"),
        ),
      );
    }
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> updateHarvestDialog(
      BuildContext context, Map<String, dynamic> info) async {
    int harvestId = info['id'];
    String productName = info['product_name'];
    String productQty = info['product_qty'].toString();
    String startDate = info['start_date'];
    String endDate = info['end_date'];
    String farmId = info['farm_id'].toString();
    productNameController = TextEditingController(text: productName);
    productQtyController = TextEditingController(text: productQty);
    startDateController = TextEditingController(text: startDate);
    endDateController = TextEditingController(text: endDate);
    selectedFarmName = farmId;
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
                      items: farmList.map<DropdownMenuItem<String>>((dynamic item) {
                        final farmName = item['farm_name'] as String;
                        final farmId = item['id'].toString();
                        return DropdownMenuItem<String>(
                          value: farmId,
                          child: Text(farmName),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sélectionnez une ferme';
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
                          updateHarvest(harvestId);
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
  void updateHarvest(int harvestId) async {
    ApiResponse response = await updateHarvestById(
        harvestId,
        productNameController.text.trim(),
        productQtyController.text.trim(),
        startDateController.text.trim(),
        endDateController.text.trim(),
        selectedFarmName!
  );
    if (response.data != null) {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FarmerRecoltesPage()),
              (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Récolte modifiée avec succès"),
          ),
        );
      });
    }
  }
}
