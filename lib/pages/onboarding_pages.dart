// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class OnboardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Add your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content overlay on the background
//           Container(
//             color: Color.fromARGB(255, 10, 21, 93).withOpacity(0.6), // Dark overlay to make the text stand out
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(29.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       'Welcome to RentCar',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Book your next ride easily and quickly!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         text: 'If you already have an account, ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'Login',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 // Navigate to Login Page
//                                 Navigator.pushNamed(context, '/otpPage');
//                               },
//                           ),
//                           TextSpan(
//                             text: ' or ',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'Register',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 // Navigate to Register Page
//                                 Navigator.pushNamed(context, '/register');
//                               },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Add your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content overlay on the background
          Container(
            color: Color.fromARGB(255, 10, 21, 93).withOpacity(0.6), // Dark overlay to make the text stand out
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(29.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome to RentCar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Book your next ride easily and quickly!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                     SizedBox(height: 50), // Add some spacing before the button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to Home Page
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Get Started'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15), // Vertical padding for button
                        backgroundColor: Colors.blue, // Button color
                        textStyle: TextStyle(fontSize: 18), // Text style for button
                      ),
                    ),
                    SizedBox(height: 50),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'If you already have an account, ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Login Page
                                Navigator.pushNamed(context, '/login');
                              },
                          ),
                          TextSpan(
                            text: ' or ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Register Page
                                Navigator.pushNamed(context, '/register');
                              },
                          ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
