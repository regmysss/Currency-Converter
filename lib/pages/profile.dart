import 'package:currencyconverter/widget/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          child: Center(
            child: CircleAvatar(
              radius: w / 4,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5), // Border radius
                child: ClipOval(child: Image.asset('assets/profile.jpg')),
              ),
            ),
          ),
        ),
        const Column(
          children: [
            ProfileData(icon: Icons.perm_identity, text: 'Maria Lubimova'),
            ProfileData(icon: Icons.date_range, text: '10.10.2004'),
            ProfileData(icon: Icons.phone_android, text: '+38 093 423 2354'),
            ProfileData(icon: Icons.email_outlined, text: 'ramdom@gmail.com'),
          ],
        ),
        Container(
          height: 50,
          width: w / 2,
          margin: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white10,
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: () {},
            child: Center(
              child: Text(
                'Edit profile',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
