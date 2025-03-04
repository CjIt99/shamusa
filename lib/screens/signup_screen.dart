import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamusa/screens/interests_screen.dart';
import 'package:shamusa/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  final bool cameFromLogin;

  const SignupScreen({super.key, required this.cameFromLogin});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedDay = "1";
  String selectedMonth = "1";
  String selectedYear = "2025";

  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> months =
      List.generate(12, (index) => (index + 1).toString());
  final List<String> years =
      List.generate(26, (index) => (2025 - index).toString());

  Widget _buildDropdown(List<String> items, String selectedValue,
      void Function(String?) onChanged) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFA5D6A7),
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value,
                    style: const TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 25,
                        color: Colors.white)),
              );
            }).toList(),
            dropdownColor: const Color(0xFF3E7045),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _handleBackNavigation() {
    if (widget.cameFromLogin) {
      // If user came from login, navigate back to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // Otherwise, just pop the screen to go back to home
      Navigator.pop(context);
    }
  }

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
                  colors: [Color(0xFF87CEFA), Color(0xFFAFEEEE)],
                ),
              ),
            ),

            // Custom Back Button with proper navigation handling
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
                  onPressed: _handleBackNavigation,
                ),
              ),
            ),

            // Main content
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF3E7045),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email input
                    _buildTextField("البريد الالكتروني"),
                    const SizedBox(height: 20),

                    // Password input
                    _buildTextField("كلمة السر", isPassword: true),
                    const SizedBox(height: 20),

                    // Confirm password input
                    _buildTextField("إعادة كتابة كلمة السر", isPassword: true),
                    const SizedBox(height: 20),

                    // Child age selection label
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "حدد عمر طفلك",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Schyler',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Age selection dropdowns
                    Row(
                      children: [
                        _buildDropdown(days, selectedDay, (newValue) {
                          setState(() => selectedDay = newValue!);
                        }),
                        const SizedBox(width: 10),
                        _buildDropdown(months, selectedMonth, (newValue) {
                          setState(() => selectedMonth = newValue!);
                        }),
                        const SizedBox(width: 10),
                        _buildDropdown(years, selectedYear, (newValue) {
                          setState(() => selectedYear = newValue!);
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Sign up button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InterestsScreen(
                              cameFromLogin: false,
                              cameFromSignup: true,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF77C043),
                        minimumSize: const Size(250, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: const Text(
                        "إنشاء الحساب",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
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

  Widget _buildTextField(String hintText, {bool isPassword = false}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textAlign: TextAlign.right,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.white, fontFamily: 'Schyler'),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
