import 'package:flutter/material.dart';
import 'package:weather_test1/InformationScreen.dart';
import 'package:weather_test1/WeatherScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: InformationScreen.id,
      routes: {

        InformationScreen.id: (context) => const InformationScreen(
          title: 'Am Language',
        ),



        WeatherScreen.id: (context) => WeatherScreen(currentCity: ModalRoute.of(context)?.settings.arguments),

      },
    );
  }
}

