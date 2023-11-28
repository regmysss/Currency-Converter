import 'dart:convert';
import 'package:http/http.dart' as http;
//https://api.privatbank.ua/p24api/exchange_rates?json&date=01.12.2022 API course

class ApiClient{
  final Uri uri = Uri.parse('https://api.privatbank.ua/p24api/exchange_rates?json&date=01.12.2022');

  Future<Map<String,double>> getCourses() async{
    Map<String,double> courses = {};

    var response = await http.get(uri);

    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      List<dynamic> exchangeRateList = data['exchangeRate'];

      for(var rate in exchangeRateList){
        courses[rate['currency'].toString()] = rate['saleRateNB'];
      }
    }
    else{
      throw Exception('Error to load API');
    }

    return courses;
  }
}