//make the image enlarge with animation

import 'package:e_learning_final_project/view/screens/auth/auth_pages/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../onboarding_pages.dart/first_time_onboarding.dart';
import '../onboarding_pages.dart/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    // Create a linear animation that goes from 0.0 (invisible) to 1.0 (fully visible)
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    // Start the animation
    controller.forward().then((_) {
      // When the animation is complete, navigate to the main screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the screen is disposed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You can customize your splash screen UI here
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Hero(
            tag: 'splash_image', // Unique tag for the Hero animation
            child: Image.asset(
              'assets/images/logo.png',
              scale: 1, // Replace with the path to your image asset
              width: 200, // Adjust the initial width as needed
              height: 200, // Adjust the initial height as needed
            ),
          ),
        ),
      ),
    );
  }
}




//make  the image to be invisible and start to appear clearly


// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   double scale = 5;

//   @override
//   void initState() {
//     super.initState();

//     // Create an animation controller
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4), // Adjust the duration as needed
//     );

//     // Create a curved animation for a more pleasing effect
//     final CurvedAnimation curve =
//         CurvedAnimation(parent: controller, curve: Curves.easeInOut);

//     // Add a listener to continuously scale the image
//     controller.addListener(() {
//       setState(() {
//         scale = curve.value; // Scale based on the animation curve
//       });
//     });

//     // Start the animation
//     controller.forward().then((_) {
//       // When the animation is complete, navigate to the main screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => MainScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     // Dispose of the animation controller when the screen is disposed
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // You can customize your splash screen UI here
//       body: Center(
//         child: Transform.scale(
//           scale: scale,
//           child: Hero(
//             tag: 'splash_image', // Unique tag for the Hero animation
//             child: Image.asset(
//               'assets/images/onboarding_images/image1.jpg', // Replace with the path to your image asset
//               width: 200, // Adjust the initial width as needed
//               height: 200, // Adjust the initial height as needed
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Main Screen!'),
//       ),
//     );
//   }
// }
