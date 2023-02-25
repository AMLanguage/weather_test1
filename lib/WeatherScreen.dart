import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  var currentCity;

  WeatherScreen({super.key, required this.currentCity});

  static const id = '/weather';

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  var weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.currentCity}'
        '&appid=b2a7d208ec17c1c471a982aa39378a2b');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return weatherData == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrangeAccent,
              title: Text('Weather'),
            ),
            body: Stack(
              children: [
                Image.asset(
                  "images/image004.jpg",
                ),
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            weatherData['name'],
                            style: TextStyle( color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(10.0, 10.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "${(weatherData['main']['temp'] - 273.15).toStringAsFixed(1)} °C",
                              style: TextStyle(color: Colors.white,shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ], fontSize: 40, fontWeight: FontWeight.bold)),
                          Text(weatherData['weather'][0]['description'],
                              style: TextStyle(color: Colors.white, shadows:
                              <Shadow>[
                                Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ], fontSize: 40, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
