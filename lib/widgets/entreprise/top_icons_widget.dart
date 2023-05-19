import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class TopIconsWidget extends StatelessWidget implements PreferredSizeWidget {
  // ignore: non_constant_identifier_names
  final Image header_image;
  final String desciption;
  const TopIconsWidget(
      // ignore: non_constant_identifier_names
      {required this.header_image,
      required this.desciption,
      super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: GlobalColors.iconsBackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: header_image,
        ),
        const SizedBox(height: 10),
        Text(
          desciption,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: GlobalColors.textColor,
          ),
        ),
      ],
    );
  }
}
