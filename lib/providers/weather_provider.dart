import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherData;
  set weatherDataF(WeatherModel weather) {
    weatherData = weather;
    notifyListeners();
  }
  WeatherModel get weatherDataF=>weatherData!;
}
