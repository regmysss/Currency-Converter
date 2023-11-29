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
    var w = MediaQuery.of(context).size.width;

    if (!isInit) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    print(course);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Currency\nConverter',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                letterSpacing: 1.5,
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      width: w,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButton(
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                        ),
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
                  ),
                ],
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      width: w,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButton(
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                        ),
                        value: course.keys.last,
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Amount',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your sum of money',
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Center(
                  child: Text(
                    'Convert',
                    style: GoogleFonts.roboto(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Conversion',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              width: w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Colors.white10,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '15.00 XAU',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
