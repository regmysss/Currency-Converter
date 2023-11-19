import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildButton extends StatelessWidget {
  final String nameBtn;
  final IconData iconData;
  final double? sizeBtn;
  final VoidCallback onTap;

  const BuildButton(
      {super.key,
      required this.nameBtn,
      required this.iconData,
      this.sizeBtn,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Center(
        child: Column(
          children: [
            Icon(
              iconData,
              size: sizeBtn ?? 40,
            ),
            Text(
              nameBtn,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
