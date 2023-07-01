import 'package:flutter/material.dart';

class WeatherModel {
  late String? city;
  late String? date;
  late double? minTempC;
  late double? maxTempC;
  late double? avgTempC;
  late String? icon;
  late String? status;

  WeatherModel({
    this.city,
    this.date,
    this.minTempC,
    this.maxTempC,
    this.avgTempC,
    this.icon,
    this.status,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        city: data['location']['name'],
        date: data['location']['localtime'],
        minTempC: jsonData['mintemp_c'],
        maxTempC: jsonData['maxtemp_c'],
        avgTempC: jsonData['avgtemp_c'],
        icon: jsonData['condition']['icon'],
        status: jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'city : $city || '
        'date : $date || '
        'minTempC : $minTempC || '
        'maxTempC : $maxTempC ||'
        ' avgTempC : $avgTempC || '
        ' icon : $icon || '
        ' status : $status || '
    ;
  }
  MaterialColor getThemeColor(){
    if(status == 'Clear' || status == 'Light Cloud' || status == 'Sunny'){
      return Colors.orange;
    } else if(status == 'Sleet' || status == 'Snow' || status == 'Hail'){
      return Colors.blue;
    } else if(status == 'Heavy Cloud' ){
      return Colors.blueGrey;
    } else if(status == 'Light Rain' || status == 'Heavy Rain' || status == 'Showers' || status == 'Patchy rain possible'){
      return Colors.blue;
    }
    else{
      return Colors.indigo;
    }
  }

}
