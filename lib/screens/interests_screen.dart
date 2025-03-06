// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamusa/screens/login_screen.dart';
import 'package:shamusa/screens/signup_screen.dart';
import 'package:shamusa/screens/sun_screen.dart';
import 'package:shamusa/widgets/custom_back_button.dart';

class InterestsScreen extends StatefulWidget {
  final bool cameFromLogin;
  final bool cameFromSignup;

  const InterestsScreen({
    super.key,
    required this.cameFromLogin,
    this.cameFromSignup = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = [
    "الفنون",
    "الطبخ",
    "الموسيقى",
    "العلوم",
    "الرياضة",
    "التكنولوجيا و الروبوتات",
    "القصص و المطالعة",
    "الألغاز و التحديات الذهنية",
    "التجارب العلمية",
    "الحرف اليدوية",
    "الألعاب",
    "الطبيعة و الحيوانات",
    "الاستكشاف و المغامرة",
    "الزراعة"
  ];

  final Set<String> selectedInterests = {};

  void _toggleInterest(String interest) {
    setState(() {
      selectedInterests.contains(interest)
          ? selectedInterests.remove(interest)
          : selectedInterests.add(interest);
    });
  }

  void _handleBackNavigation() {
    if (widget.cameFromLogin) {
      // If user came from login, navigate back to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else if (widget.cameFromSignup) {
      // If user came from signup, navigate back to SignupScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(cameFromLogin: false),
        ),
      );
    } else {
      // Otherwise, just pop the screen to go back
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

            // Custom back button with proper navigation handling
            CustomBackButton(
              cameFromLogin: widget.cameFromLogin,
              onPressed: _handleBackNavigation,
            ),

            // Interests container with scrollable list
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
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
                        "اختر اهتمامات طفلك",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 250,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.5,
                          ),
                          itemCount: interests.length,
                          itemBuilder: (context, index) {
                            final interest = interests[index];
                            final isSelected =
                                selectedInterests.contains(interest);
                            return GestureDetector(
                              onTap: () => _toggleInterest(interest),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.green[700],
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Center(
                                  child: Text(
                                    interest,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.green[700]
                                          : Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Schyler',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedInterests.isNotEmpty
                            ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SunnyScreen()),
                                )
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF77C043),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "متابعة",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Schyler',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
