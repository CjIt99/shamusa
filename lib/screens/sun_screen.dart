import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shamusa/widgets/custom_back_button.dart';

class SunnyScreen extends StatefulWidget {
  const SunnyScreen({super.key});

  @override
  _SunnyScreenState createState() => _SunnyScreenState();
}

class _SunnyScreenState extends State with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  String displayText = "اضغط على الشمس للتحدث"; // Default text

  void _toggleAnimation() {
    setState(() {
      if (isPlaying) {
        _controller.stop();
        displayText = "اضغط على الشمس للتحدث"; // Reset text when stopped
      } else {
        _controller.repeat();
        displayText = "الاستماع..."; // Update text when active
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: Stack(
          alignment: Alignment.center,
          children: [
            const CustomBackButton(cameFromLogin: false),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Text(
                displayText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: _toggleAnimation,
                child: Lottie.asset(
                  'assets/sun_animation.json',
                  controller: _controller,
                  width: 350,
                  height: 350,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
