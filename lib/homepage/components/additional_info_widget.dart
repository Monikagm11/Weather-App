import "package:flutter/material.dart";

class AdditionalInfoWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String temp;
  const AdditionalInfoWidget(
      {super.key, required this.icon, required this.label, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          temp,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
