import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/modules/home_screen.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pacifico',
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData != null
            ? Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
            : Colors.indigo,
      ),
      home: HomeScreen(),
    );
  }
}

// API Key: 232df36969034d95931163154230606
