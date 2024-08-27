import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wheatherapp/homepage/components/additional_info_widget.dart';
import 'package:wheatherapp/homepage/components/wheather_forecast_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(0xff91cfec),
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: const Color(0xff91cfec),
          title: Text("Weather App",
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "200.1 K",
                              style: TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 64,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Clouds",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120,
                      child: WeatherForecastCard(
                        time: "00.00",
                        icon: Icons.cloud,
                        temp: "200k",
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: WeatherForecastCard(
                        time: "00.00",
                        icon: Icons.cloud,
                        temp: "200k",
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: WeatherForecastCard(
                        time: "00.00",
                        icon: Icons.cloud,
                        temp: "200k",
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: WeatherForecastCard(
                        time: "00.00",
                        icon: Icons.cloud,
                        temp: "200k",
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: WeatherForecastCard(
                        time: "00.00",
                        icon: Icons.cloud,
                        temp: "200k",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Additional Information",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInfoWidget(
                      icon: Icons.water_drop, label: "Humidity", temp: "91"),
                  AdditionalInfoWidget(
                      icon: Icons.air, label: "Wind Speed", temp: "91"),
                  AdditionalInfoWidget(
                      icon: Icons.beach_access, label: "Pressure", temp: "91"),
                ],
              )
            ],
          ),
        ));
  }
}
