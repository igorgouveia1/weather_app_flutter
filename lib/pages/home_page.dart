import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/assets/weather_theme.dart';

import '../components/custom_textfield_component.dart';
import '../models/weather_provider.dart';
import 'package:weather_app_flutter/models/weather_icon_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchFieldButton(),
            const SizedBox(
              height: 30,
            ),
            if (weatherProvider.weatherData != null)
              Icon(
                getWeatherIcon(weatherProvider.weatherData!.description),
                size: 72,
                color: lightColorScheme.background,
              )
            else
              Icon(
                Icons.pin_drop,
                size: 72,
                color: lightColorScheme.background,
              ),
            if (weatherProvider.weatherData != null)
              Column(
                children: [
                  Text(
                    weatherProvider.weatherData!.name,
                    style: TextStyle(
                        fontSize: 24, color: lightColorScheme.background),
                  ),
                  Text(
                    '${weatherProvider.weatherData!.temperature}°C',
                    style: TextStyle(
                        fontSize: 32, color: lightColorScheme.background),
                  ),
                  Text(
                    weatherProvider.weatherData!.description,
                    style: TextStyle(
                        fontSize: 16, color: lightColorScheme.background),
                  ),
                ],
              )
            else
              Text(
                'Select your city',
                style:
                    TextStyle(fontSize: 16, color: lightColorScheme.background),
              ),
          ],
        ),
      ),
    );
  }
}
