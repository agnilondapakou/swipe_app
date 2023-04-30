import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';

class FarmerRecolteCardWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String product_name;
  // ignore: non_constant_identifier_names
  final String farm_name;
  final int quantity;
  final String period;
  // ignore: non_constant_identifier_names
  final String delete_route;
  // ignore: non_constant_identifier_names
  final String update_route;
  // ignore: non_constant_identifier_names
  final String button_text;
  // ignore: non_constant_identifier_names
  final Color bg_color;

  const FarmerRecolteCardWidget(
      // ignore: non_constant_identifier_names
      {required this.product_name,
      // ignore: non_constant_identifier_names
      required this.farm_name,
      required this.quantity,
      required this.period,
      // ignore: non_constant_identifier_names
      required this.delete_route,
      // ignore: non_constant_identifier_names
      required this.update_route,
      // ignore: non_constant_identifier_names
      required this.button_text,
      // ignore: non_constant_identifier_names
      required this.bg_color,
      super.key});

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
                  'assets/icons/tree.png',
                ),
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
                    product_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    farm_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    period,
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
                          Navigator.pushNamed(context, update_route);
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
                          Navigator.pushNamed(context, delete_route);
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
