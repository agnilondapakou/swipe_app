import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../models/api_response.dart';
import '../../screens/fermes/fermes_pages.dart';
import '../../services/farm/farm_service.dart';

class FermeCardWidget extends StatefulWidget {
  final String ferme_name;
  final String city;
  final String delete_route;
  final String update_route;

  const FermeCardWidget({
    required this.ferme_name,
    required this.city,
    required this.delete_route,
    required this.update_route,
    Key? key,
  }) : super(key: key);

  @override
  _FermeCardWidgetState createState() => _FermeCardWidgetState();
}

class _FermeCardWidgetState extends State<FermeCardWidget> {
  void deleteFarm(String type) async {
    ApiResponse response = await deleteFarmById(type);
    if (response.data != null) {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FermePage()),
              (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Ferme supprimée avec succès"),
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
      desc: 'Êtes-vous sûr de vouloir supprimer cette ferme ?',
      btnCancelText: 'Annuler',
      btnCancelColor: GlobalColors.primaryColor, // Change the cancel button color
      btnOkText: 'Supprimer',
      btnOkColor: GlobalColors.logoutColor, // Change the delete button color
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        deleteFarm(widget.delete_route);
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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
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
                  ],
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.ferme_name,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Text(
                      widget.city,
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
                          // Handle edit button press
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
