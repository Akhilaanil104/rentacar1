// import 'onboarding_pages.dart';
// import 'package:flutter/material.dart';

// class SpalshPage extends StatefulWidget {
//   const SpalshPage({super.key});

//   @override
//   State<SpalshPage> createState() => _SpalshPageState();
// }

// class _SpalshPageState extends State<SpalshPage> {
//    void initState() {
//     super.initState();
//     _navigateToOnboarding();
//   }

//   // Navigate to the home page after the splash duration
//   void _navigateToOnboarding() async {
//     await Future.delayed(Duration(seconds: 3)); // Splash duration
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => OnboardingPage()), // Navigate to HomePage
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Color.fromARGB(255, 102, 114, 193).withOpacity(0.6) ,
//       body: Center(child: Text("RENTCAR",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36),),),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_pages.dart';
import 'home_page.dart'; // Import your home page

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check login status using SharedPreferences
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(Duration(seconds: 3)); // Splash duration
    if (isLoggedIn) {
      // Navigate to HomePage if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // HomePage if logged in
      );
    } else {
      // Navigate to Onboarding if not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 114, 193).withOpacity(0.6),
      body: Center(
        child: Text(
          "RENTCAR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
