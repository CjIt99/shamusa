import 'package:flutter/material.dart';
import 'package:shamusa/widgets/animated_sun.dart';
import 'package:shamusa/widgets/custom_back_button.dart';


class SunnyScreen extends StatelessWidget {
  const SunnyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: const Stack(
          children: [
            CustomBackButton(cameFromLogin: false),
            // Animated Sun
            Center(
              child: AnimatedSun(),
            ),
          ],
        ),
      ),
    );
  }
}
