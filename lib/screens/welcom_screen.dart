import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamusa/screens/login_screen.dart';
import 'package:shamusa/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFBDE0FE), Color(0xFFFDF4A8)],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 10,
                right: -12,
                child: SvgPicture.asset(
                  'assets/cloud.svg',
                  width: 450,
                ),
              ),
              Positioned(
                bottom: -30,
                child: SvgPicture.asset(
                  'assets/sun.svg',
                  width: 400,
                ),
              ),
              Positioned(
                bottom: -50,
                left: 150,
                child: Image.asset(
                  'assets/tree1.png',
                  width: 300,
                ),
              ),
              Positioned(
                bottom: -190,
                right: 220,
                child: Image.asset(
                  'assets/tree2.png',
                  width: 280,
                ),
              ),
              const Positioned(
                top: 150,
                child: Column(
                  children: [
                    Text(
                      "شموسة",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler', // Apply custom font
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black26)
                        ],
                      ),
                    ),
                    Text(
                      "ترحب بكم",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: 'Schyler', // Apply custom font
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black26)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 180,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF77C043),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 62, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen(
                                    cameFromLogin: false,
                                  )),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF77C043),
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "انشاء حساب جديد",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF77C043),
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
