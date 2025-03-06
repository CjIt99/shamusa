// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AnimatedSun extends StatefulWidget {
//   const AnimatedSun({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AnimatedSunState createState() => _AnimatedSunState();
// }

// class _AnimatedSunState extends State<AnimatedSun>
//     with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late AnimationController _opacityController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Scaling (Pulsing effect)
//     _scaleController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//       lowerBound: 0.9,
//       upperBound: 1.1,
//     )..repeat(reverse: true);

//     _scaleAnimation =
//         Tween<double>(begin: 1.0, end: 1.2).animate(_scaleController);

//     // Opacity (Glowing effect)
//     _opacityController = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat(reverse: true);

//     _opacityAnimation =
//         Tween<double>(begin: 0.8, end: 1.0).animate(_opacityController);
//   }

//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _opacityController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Positioned(
//         top: 200,
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               child: Opacity(
//                 opacity: _opacityAnimation.value,
//                 child: SvgPicture.asset(
//                   'assets/final_sun.svg', // Ensure this file is in the assets folder
//                   width: 250,
//                   height: 650,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     ]);
//   }
// }
