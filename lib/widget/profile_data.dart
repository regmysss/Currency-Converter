import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileData extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileData({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: GoogleFonts.roboto(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
