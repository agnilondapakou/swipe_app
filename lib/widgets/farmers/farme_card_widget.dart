import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';

class FermeCardWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String ferme_name;
  final String city;
  // ignore: non_constant_identifier_names
  final String phone_number;
  // ignore: non_constant_identifier_names
  final String delete_route;
  // ignore: non_constant_identifier_names
  final String update_route;

  const FermeCardWidget(
      {
      // ignore: non_constant_identifier_names
      required this.ferme_name,
      required this.city,
      // ignore: non_constant_identifier_names
      required this.phone_number,
      // ignore: non_constant_identifier_names
      required this.delete_route,
      // ignore: non_constant_identifier_names
      required this.update_route,
      // ignore: non_constant_identifier_names
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
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: AssetImage(
                    'assets/icons/ferme.png',
                  ),
                  width: 70,
                  height: 70,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ferme :',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      'Ville :',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      'Téléphone :',
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
                      ferme_name,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      city,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      phone_number,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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