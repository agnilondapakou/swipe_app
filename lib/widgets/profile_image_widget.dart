import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: non_constant_identifier_names
  final Image profile_image;
  // ignore: non_constant_identifier_names
  const ProfileImageWidget({super.key, required this.profile_image});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 75.0,
      backgroundColor: const Color(0xFF669358),
      child: CircleAvatar(
        radius: 70.0,
        backgroundImage: profile_image.image,
      ),
    );
  }
}
