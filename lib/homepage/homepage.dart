import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/homepage/components/additional_info_widget.dart';
import 'package:weatherapp/homepage/components/weather_forecast_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getweather() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?q=Kathmandu,nepal&APPID=166806596f945b4b5c6c14f21dc330a2");
      print(response);
      final data = response.data;

      final statuscode = data["cod"];

      debugPrint(data["cod"]);
      debugPrint(data["list"][0]["main"]["temp"].toString());
      debugPrint(data["list"][0]["main"]["humidity"].toString());
      debugPrint(data["list"][0]["main"]["pressure"].toString());
      debugPrint(data["list"][0]["wind"]["speed"].toString());

      // if (statuscode != 200) {
      //   throw "An unexpected error occured";
      // }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  initState() {
    super.initState();
    weather = getweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(0xff91cfec),
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: const Color(0xff91cfec),
          title: Text("Weather App",
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
                onPressed: () {
                  getweather();
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 24,
                ))
          ],
        ),
        body: FutureBuilder(
            future: weather,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final data = snapshot.data!;

              final currentWeatherdata = data["list"][0]["main"];
              final currentsky = data["list"][0]["weather"][0]["main"];
              final currenttemp = currentWeatherdata["temp"].toString();
              final currentpressure = currentWeatherdata["pressure"].toString();
              final currenthumidity = currentWeatherdata["humidity"].toString();
              final currentwindspeed = data["list"][0]["wind"]["speed"];

              return Padding(
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
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$currenttemp K",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.cloud,
                                    size: 64,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    currentsky.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Hourly Forecast",
                        style: TextStyle(fontSize: 22)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                        itemBuilder: (context, index) {
                          final hourlyForecast = data['list'][index + 1];
                          final hourlySky =
                              data['list'][index + 1]['weather'][0]['main'];
                          final hourlyTemp =
                              hourlyForecast['main']['temp'].toString();
                          final time = DateTime.parse(hourlyForecast['dt_txt']);

                          return WeatherForecastCard(
                            time: DateFormat.j().format(time),
                            temp: "$hourlyTemp K",
                            icon: hourlySky == "Clouds" || hourlySky == "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Additional Information",
                        style: TextStyle(fontSize: 22)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AdditionalInfoWidget(
                            icon: Icons.water_drop,
                            label: "Humidity",
                            temp: currenthumidity),
                        AdditionalInfoWidget(
                            icon: Icons.air,
                            label: "Wind Speed",
                            temp: currentwindspeed.toString()),
                        AdditionalInfoWidget(
                            icon: Icons.beach_access,
                            label: "Pressure",
                            temp: currentpressure),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
