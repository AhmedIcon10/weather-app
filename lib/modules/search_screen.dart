import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/network/weather_service.dart';

import '../shared/components.dart';

class SearchScreen extends StatelessWidget {
SearchScreen({this.updateUi});
  VoidCallback? updateUi;
  String? cityName;
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city',
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customFormField(
                      onSubmit: (data) async{
                        cityName = data;
                        WeatherService service = WeatherService();
                        WeatherModel weather = await service.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false).weatherData = weather ;
                        updateUi!();
                        print(weather);
                        Navigator.pop(context);
                      },
                      prefix: Icons.search,
                      label: 'Search',
                      hintText: 'Enter a city name',
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (char) {
                        if (formKey.currentState!.validate()) {
                          return 'Please Enter to search';
                        } else {
                          return null;
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
