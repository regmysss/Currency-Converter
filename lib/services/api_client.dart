import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final Uri uri = Uri.parse('https://api.privatbank.ua/p24api/exchange_rates?json&date=01.12.2022');

  Future<Map<String, double>> getCourses() async {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final rates = data['exchangeRate'] as List<dynamic>;

      Map<String, double> exchangeRates = {};
      for (var rate in rates) {
        exchangeRates[rate['currency']] = rate['saleRateNB'];
      }

      return exchangeRates;
    } else {
      throw Exception('Failed to load exchange rates from API');
    }
  }
}