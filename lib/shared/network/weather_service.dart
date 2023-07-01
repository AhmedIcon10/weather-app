import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
   String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '232df36969034d95931163154230606';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
     Map<String, dynamic> data =  jsonDecode(response.body);
     WeatherModel weatherModel =  WeatherModel.fromJson(data);
     return weatherModel;

  }
}
