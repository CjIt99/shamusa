import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamusa/screens/interests_screen.dart';
import 'package:shamusa/screens/signup_screen.dart';
import 'package:shamusa/screens/welcom_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF87CEFA),
                    Color(0xFFAFEEEE)
                  ], // Light blue gradient
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.blue, size: 24),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  },
                ),
              ),
            ),
            // Main content
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF3E7045), // Green background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Email field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني",
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const TextField(
                        obscureText: true,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "كلمة المرور",
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forgot password
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Schyler',
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InterestsScreen(
                              cameFromLogin: true,
                              cameFromSignup: false,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF77C043),
                        minimumSize: const Size(250, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Divider with "or" text
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 3,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "أو",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Schyler',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Sign up text with navigation to SignupScreen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(
                                    cameFromLogin: true),
                              ),
                            );
                          },
                          child: const Text(
                            "إنشاء حساب",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 25,
                              fontFamily: 'Schyler',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Text(
                          "لا تملك حساب؟",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Schyler',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Cloud SVG at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/cloud2.svg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
