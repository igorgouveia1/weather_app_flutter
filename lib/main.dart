import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/models/weather_provider.dart';
import 'package:weather_app_flutter/pages/home_page.dart';

import 'assets/weather_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      theme: ThemeData(
        brightness: lightColorScheme.brightness,
        scaffoldBackgroundColor: lightColorScheme.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.primary,
          titleTextStyle: TextStyle(
            color: lightColorScheme.background,
            fontSize: 24,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
