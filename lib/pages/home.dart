import 'package:flutter/material.dart';
import 'package:currencyconverter/services/api_client.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<String, double> course;
  bool isInit = false;

  @override
  void initState() {
    super.initState();

    ApiClient().getCourses().then((value) {
      course = value;
      setState(() {
        isInit = true;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    print(course);
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
                      border: OutlineInputBorder()),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: course.keys.first,
                    alignment: Alignment.centerRight,
                    items: course.keys.map((key) {
                      return DropdownMenuItem(
                        value: key,
                        child: Center(
                          child: Text(key),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
