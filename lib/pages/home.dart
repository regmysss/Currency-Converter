import 'package:currencyconverter/widget/buildButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              width: w,
              child: Text(
                'Current course will be here',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            width: w,
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildButton(
                  nameBtn: "Main",
                  iconData: Icons.home,
                  onTap: () {Navigator.pushNamed(context, '/main');},
                ),
                BuildButton(
                    nameBtn: "Profile",
                    iconData: Icons.perm_identity,
                    onTap: () {Navigator.pushNamed(context, '/profile');}),
                BuildButton(
                    nameBtn: "Settings",
                    iconData: Icons.settings,
                    onTap: () {Navigator.pushNamed(context, '/settings');}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
