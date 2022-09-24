import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String header;
  final String description;
  final String asset;

  const Slide({
    super.key,
    required this.header,
    required this.description,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(asset),
        Text(
          header,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white38,
          ),
        ),
      ],
    );
  }
}
