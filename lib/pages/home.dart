import 'package:flutter/material.dart';

//https://api.privatbank.ua/p24api/exchange_rates?json&date=01.12.2022 API course

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
    );
  }
}
