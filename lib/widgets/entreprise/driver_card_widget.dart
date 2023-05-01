import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';

class DriverCardWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String driver_first_name;
  // ignore: non_constant_identifier_names
  final String driver_last_name;
  // ignore: non_constant_identifier_names
  final String driver_email;
  // ignore: non_constant_identifier_names
  final String driver_phone_number;
  // ignore: non_constant_identifier_names
  final int delivery_count;
  // ignore: non_constant_identifier_names
  final String delete_route;
  // ignore: non_constant_identifier_names
  final String update_route;

  const DriverCardWidget(
      // ignore: non_constant_identifier_names
      {required this.driver_first_name,
      // ignore: non_constant_identifier_names
      required this.driver_last_name,
      // ignore: non_constant_identifier_names
      required this.driver_email,
      // ignore: non_constant_identifier_names
      required this.driver_phone_number,
      // ignore: non_constant_identifier_names
      required this.delivery_count,
      // ignore: non_constant_identifier_names
      required this.delete_route,
      // ignore: non_constant_identifier_names
      required this.update_route,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4.5,
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
                  'assets/icons/delivery.png',
                ),
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nom :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Prenoms :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Livraisons :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Email :',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Telephone :',
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
                    driver_first_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    driver_last_name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    delivery_count.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    driver_email,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    driver_phone_number,
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
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
