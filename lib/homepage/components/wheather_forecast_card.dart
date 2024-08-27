
import "package:flutter/material.dart";

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const  WeatherForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
           icon,
              size: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              temp,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}