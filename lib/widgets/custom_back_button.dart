import 'package:flutter/material.dart';
import 'package:shamusa/screens/login_screen.dart';
import 'package:shamusa/screens/welcom_screen.dart';

class CustomBackButton extends StatelessWidget {
  final bool cameFromLogin;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key, 
    required this.cameFromLogin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 24),
          onPressed: onPressed ?? () {
            if (cameFromLogin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}