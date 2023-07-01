import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/components.dart';

import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateUi() {
    setState(() {});
  }

  Widget buildWeatherScreen(WeatherModel weather) => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.centerRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Colors.red,
            //     Colors.orangeAccent,
            //     Colors.orangeAccent,
            //   ],
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              '${weather.city}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              'Updated : ${weather.date}',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '${weather.icon}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${weather.avgTempC!.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Max : ${weather.maxTempC!.toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Min : ${weather.minTempC!.toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '${weather.status}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      backgroundColor: weatherData != null
          ? Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
          : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(
                  context,
                  SearchScreen(
                    updateUi: updateUi,
                  ));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: weatherData != null
          ? buildWeatherScreen(weatherData)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'There is no weather \n Start Searching Now .',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: 'Pacifico',
                        height: 2),
                  ),
                ],
              ),
            ),
    );
  }
}
