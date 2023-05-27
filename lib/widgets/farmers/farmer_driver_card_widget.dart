import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';

class FarmerDriverCardWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String driver_username;
  // ignore: non_constant_identifier_names
  final String driver_contact;
  // ignore: non_constant_identifier_names
  final String delete_route;
  // ignore: non_constant_identifier_names
  final String update_route;

  const FarmerDriverCardWidget(
      // ignore: non_constant_identifier_names
      {required this.driver_username,
      // ignore: non_constant_identifier_names
      required this.driver_contact,
      // ignore: non_constant_identifier_names
      required this.delete_route,
      // ignore: non_constant_identifier_names
      required this.update_route,
      super.key});

  @override
  State<FarmerDriverCardWidget> createState() => _FarmerDriverCardWidgetState();
}

class _FarmerDriverCardWidgetState extends State<FarmerDriverCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 5.5,
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/icons/delivery.png',
                  ),
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nom :',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      'Livraisons :',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      'Telephone :',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
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
                      widget.driver_username,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      "-",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      widget.driver_contact,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                          Navigator.pushNamed(context, widget.delete_route);
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
