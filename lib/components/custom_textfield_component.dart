import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/assets/weather_theme.dart';

import '../models/weather_provider.dart';

class SearchFieldButton extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchFieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: lightColorScheme.primaryContainer,
          hintText: 'City',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          suffixIcon: IconButton(
            onPressed: () {
              weatherProvider.getWeatherData(searchController.text);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
