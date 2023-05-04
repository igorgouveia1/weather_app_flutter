import 'package:flutter/cupertino.dart';
import 'package:weather_app_flutter/models/weather_data_model.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherModel _weatherModel = WeatherModel();
  WeatherData? _weatherData;

  WeatherData? get weatherData => _weatherData;

  Future<void> getWeatherData(String cityName) async {
    try {
      final weather = await _weatherModel.getWeather(cityName);
      _weatherData = WeatherData(
        name: weather['name'],
        temperature: weather['main']['temp'],
        description: weather['weather'][0]['description'],
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    // Notifica os widgets que dependem desses dados que houve uma atualização
    notifyListeners();
  }
}
