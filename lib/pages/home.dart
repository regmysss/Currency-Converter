import 'package:flutter/material.dart';
import 'package:currencyconverter/services/api_client.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Center(
        //     child: Text(
        //       'Converter',
        //       style: GoogleFonts.roboto(
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold
        //       ),
        //     ),
        //   ),
        // ),
        body: Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                'Convert UAH to any currency',
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter sum of money',
                  border: OutlineInputBorder()
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
