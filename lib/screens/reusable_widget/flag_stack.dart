import 'package:flutter/material.dart';

class FlagStack extends StatelessWidget {
  final double size;
  final String country1;
  final String country2;
  const FlagStack({super.key, required this.size, required this.country1, required this.country2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size * 3 / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(country1, height: size, width: size),
          Positioned(
              top: size / 2,
              left: size / 2,
              child: Image.asset(country2, height: size, width: size)),
        ],
      ),
    );
  }
}
