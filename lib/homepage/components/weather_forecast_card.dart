import "package:flutter/material.dart";

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const WeatherForecastCard({
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              temp,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
