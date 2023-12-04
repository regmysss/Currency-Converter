import 'package:flutter/material.dart';
import 'package:CurrencyConverter/services/api_client.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<String, double> _courses;
  bool _isInit = false;
  String _error = 'asd';
  final _controllerAmount = TextEditingController();

  String _fromCourse = 'UAH';
  String _toCourse = 'USD';
  String _conversion = '';

  String _calculateCourse(from, to) {
    double? amount = double.parse(_controllerAmount.text);
    double result = 0;

    if (from == 'UAH') {
      result = amount / _courses[to]!;
    } else {
      result = amount * (_courses[from]! / _courses[to]!);
    }

    return '${result.toStringAsFixed(3)} $to';
  }

  void _loadCourses() async {
    setState(() {
      _error = '';
      _isInit = false;
    });

    ApiClient().getCourses().then((value) {
      _courses = value;
      setState(() {
        _isInit = true;
      });
    }).catchError((error) {
      setState(() {
        _error = error;
      });
      debugPrint(error);
    });
  }

  @override
  void dispose() {
    _controllerAmount.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    final appLocal = AppLocalizations.of(context)!;

    if (_error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ERROR: $_error',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadCourses,
              child: Text(
                appLocal.retry,
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (!_isInit) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocal.currencyConverter,
                style: GoogleFonts.roboto(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  letterSpacing: 1.5,
                ),
              ),
              DropDownMenuCourses(
                map: _courses,
                current: _fromCourse,
                label: appLocal.fromCourse,
                onTap: (value) {
                  setState(() {
                    _fromCourse = value!;
                  });
                },
              ),
              DropDownMenuCourses(
                map: _courses,
                current: _toCourse,
                label: appLocal.toCourse,
                onTap: (value) {
                  setState(() {
                    _toCourse = value!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                appLocal.amount,
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
                child: TextField(
                  controller: _controllerAmount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: appLocal.enterSumOfMoney,
                    hintStyle: const TextStyle(
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (_controllerAmount.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      _conversion = _calculateCourse(_fromCourse, _toCourse);
                    });
                  },
                  child: Center(
                    child: Text(
                      appLocal.convert,
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
                appLocal.result,
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
                    _conversion,
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
      ),
    );
  }
}

class DropDownMenuCourses extends StatelessWidget {
  final String current;
  final Map<String, double> map;
  final String label;
  final Function(String? value) onTap;

  const DropDownMenuCourses({
    super.key,
    required this.current,
    required this.map,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
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
                value: current,
                alignment: Alignment.centerRight,
                items: map.keys.map((key) {
                  return DropdownMenuItem(
                    value: key,
                    child: Center(
                      child: Text(key),
                    ),
                  );
                }).toList(),
                onChanged: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
