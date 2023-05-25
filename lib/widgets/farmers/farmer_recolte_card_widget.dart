import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/services/harvest/harvest_service.dart';
import 'package:swipe_app/utils/constants.dart';

import '../../models/api_response.dart';
import '../../screens/recoltes/farmers/farmer_recoltes_page.dart';

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
                          Navigator.pushNamed(context, widget.update_route);
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
}
