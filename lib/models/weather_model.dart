import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  final String? apiKey = dotenv.env['API_KEY'];
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getWeather(String cityName) async {
    final url = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
