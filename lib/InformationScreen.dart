import 'package:flutter/material.dart';
import 'package:weather_test1/WeatherScreen.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key, required this.title});
  static const String id = 'information_screen';

  final String title;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);

    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF00BFFF), Color(0xFFFFA500)],
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: screenWidth,
                  child: Image.asset("images/image002.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.white, fontSize: 50
                        ),
                        textAlign: TextAlign.center,
                        enabled: true,
                        controller: tfControl,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                          ),
                          labelText: "Type here",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintText: "Weather",
                          hintStyle:
                              TextStyle(fontSize: 40, color: Colors.white38),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (tfControl.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "The Textfield is empty",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            String currentCity = tfControl.text;
                            Navigator.pushNamed(context, WeatherScreen.id,
                                arguments: currentCity);
                            print("Weather of $currentCity");
                            tfControl.text = "";
                          }
                        },
                        child:
                            Icon(Icons.search, color: Colors.white, size: 40),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
