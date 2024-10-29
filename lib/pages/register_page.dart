// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';

// // // class RegistrationPage extends StatefulWidget {
// // //   @override
// // //   _RegistrationPageState createState() => _RegistrationPageState();
// // // }

// // // class _RegistrationPageState extends State<RegistrationPage> {
// // //   final _auth = FirebaseAuth.instance;

// // //   // Controllers for text input
// // //   final TextEditingController _emailController = TextEditingController();
// // //   final TextEditingController _passwordController = TextEditingController();
// // //   final TextEditingController _confirmPasswordController = TextEditingController();

// // //   // Variables to manage UI state
// // //   bool _isLoading = false;
// // //   String _errorMessage = '';

// // //   // Registration function
// // //   Future<void> _registerUser() async {
// // //     setState(() {
// // //       _isLoading = true;
// // //     });

// // //     if (_passwordController.text != _confirmPasswordController.text) {
// // //       setState(() {
// // //         _isLoading = false;
// // //         _errorMessage = 'Passwords do not match';
// // //       });
// // //       return;
// // //     }

// // //     try {
// // //       // Create user in Firebase
// // //       await _auth.createUserWithEmailAndPassword(
// // //         email: _emailController.text.trim(),
// // //         password: _passwordController.text.trim(),
// // //       );
      
// // //       // On success, navigate to the main app page or dashboard
// // //       Navigator.pushReplacementNamed(context, '/home');
// // //     } on FirebaseAuthException catch (e) {
// // //       setState(() {
// // //         _isLoading = false;
// // //         _errorMessage = e.message ?? 'Registration failed. Please try again.';
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           // Background image
// // //           Container(
// // //             decoration: BoxDecoration(
// // //               image: DecorationImage(
// // //                 image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Same background as OTP page
// // //                 fit: BoxFit.cover,
// // //               ),
// // //             ),
// // //           ),
// // //           Container(
// // //             color: Colors.black.withOpacity(0.6), // Dark overlay to improve text visibility
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: SingleChildScrollView(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     SizedBox(height: 80), // Adjust top space if needed
// // //                     Text(
// // //                       'Create an Account',
// // //                       textAlign: TextAlign.center,
// // //                       style: TextStyle(
// // //                         fontSize: 28,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.white, // Text color to contrast with the background
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 20),
                    
// // //                     // Email input field
// // //                     TextField(
// // //                       controller: _emailController,
// // //                       decoration: InputDecoration(
// // //                         hintText: 'Email',
// // //                         filled: true,
// // //                         fillColor: Colors.white.withOpacity(0.9), // Slight transparency for input fields
// // //                         border: OutlineInputBorder(),
// // //                       ),
// // //                       keyboardType: TextInputType.emailAddress,
// // //                     ),
// // //                     SizedBox(height: 20),

// // //                     // Password input field
// // //                     TextField(
// // //                       controller: _passwordController,
// // //                       decoration: InputDecoration(
// // //                         hintText: 'Password',
// // //                         filled: true,
// // //                         fillColor: Colors.white.withOpacity(0.9),
// // //                         border: OutlineInputBorder(),
// // //                       ),
// // //                       obscureText: true,
// // //                     ),
// // //                     SizedBox(height: 20),

// // //                     // Confirm password input field
// // //                     TextField(
// // //                       controller: _confirmPasswordController,
// // //                       decoration: InputDecoration(
// // //                         hintText: 'Confirm Password',
// // //                         filled: true,
// // //                         fillColor: Colors.white.withOpacity(0.9),
// // //                         border: OutlineInputBorder(),
// // //                       ),
// // //                       obscureText: true,
// // //                     ),
// // //                     SizedBox(height: 20),

// // //                     // Error message
// // //                     if (_errorMessage.isNotEmpty)
// // //                       Text(
// // //                         _errorMessage,
// // //                         style: TextStyle(color: Colors.red),
// // //                         textAlign: TextAlign.center,
// // //                       ),

// // //                     SizedBox(height: 20),

// // //                     // Register button
// // //                     ElevatedButton(
// // //                       onPressed: _registerUser,
// // //                       child: _isLoading
// // //                           ? CircularProgressIndicator()
// // //                           : Text('Register'),
// // //                       style: ElevatedButton.styleFrom(
// // //                         padding: EdgeInsets.symmetric(vertical: 15),
// // //                         backgroundColor: Colors.blue, // Same button color as in OTP page
// // //                       ),
// // //                     ),

// // //                     // Navigation to login page
// // //                     TextButton(
// // //                       onPressed: () {
// // //                         Navigator.pushReplacementNamed(context, '/otpPage');
// // //                       },
// // //                       child: Text(
// // //                         'Already have an account? Login here',
// // //                         style: TextStyle(color: Colors.white),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }






// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class RegistrationPage extends StatefulWidget {
// //   @override
// //   _RegistrationPageState createState() => _RegistrationPageState();
// // }

// // class _RegistrationPageState extends State<RegistrationPage> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   // Controllers for text input
// //   final TextEditingController _phoneController = TextEditingController();

// //   // Variables to manage UI state
// //   bool _isLoading = false;
// //   String _errorMessage = '';
// //   String _verificationId = '';

// //   // Function to check if the phone number is already registered
// //   Future<void> _checkPhoneNumber() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     String phoneNumber = _phoneController.text.trim();

// //     try {
// //       await _auth.fetchSignInMethodsForEmail(phoneNumber).then((methods) {
// //         if (methods.isNotEmpty) {
// //           // Phone number is already registered
// //           _showAlreadyRegisteredPopup();
// //           setState(() {
// //             _isLoading = false;
// //           });
// //         } else {
// //           // Phone number is not registered, start OTP verification
// //           _sendOTP();
// //         }
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _isLoading = false;
// //         _errorMessage = 'Failed to check phone number. Please try again.';
// //       });
// //     }
// //   }

// //   // Function to send OTP for phone verification
// //   Future<void> _sendOTP() async {
// //     await _auth.verifyPhoneNumber(
// //       phoneNumber: _phoneController.text.trim(),
// //       verificationCompleted: (PhoneAuthCredential credential) async {
// //         // Auto-sign in when verification is complete
// //         await _auth.signInWithCredential(credential);
// //         Navigator.pushReplacementNamed(context, '/home');
// //       },
// //       verificationFailed: (FirebaseAuthException e) {
// //         setState(() {
// //           _isLoading = false;
// //           _errorMessage = e.message ?? 'Verification failed. Please try again.';
// //         });
// //       },
// //       codeSent: (String verificationId, int? resendToken) {
// //         setState(() {
// //           _verificationId = verificationId;
// //           _isLoading = false;
// //         });
// //         Navigator.pushNamed(context, '/otpPage', arguments: verificationId);
// //       },
// //       codeAutoRetrievalTimeout: (String verificationId) {
// //         setState(() {
// //           _verificationId = verificationId;
// //         });
// //       },
// //     );
// //   }

// //   // Show a popup message when the phone number is already registered
// //   void _showAlreadyRegisteredPopup() {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text('Phone Number Already Registered'),
// //         content: Text('This phone number is already registered. Please log in.'),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             child: Text('OK'),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pushReplacementNamed(context, '/loginPage');
// //             },
// //             child: Text('Login'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Background image
// //           Container(
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Same background as OTP page
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           Container(
// //             color: Colors.black.withOpacity(0.6), // Dark overlay to improve text visibility
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     SizedBox(height: 80), // Adjust top space if needed
// //                     Text(
// //                       'Register with Phone Number',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white, // Text color to contrast with the background
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
                    
// //                     // Phone number input field
// //                     TextField(
// //                       controller: _phoneController,
// //                       decoration: InputDecoration(
// //                         hintText: 'Phone Number',
// //                         filled: true,
// //                         fillColor: Colors.white.withOpacity(0.9), // Slight transparency for input fields
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       keyboardType: TextInputType.phone,
// //                     ),
// //                     SizedBox(height: 20),

// //                     // Error message
// //                     if (_errorMessage.isNotEmpty)
// //                       Text(
// //                         _errorMessage,
// //                         style: TextStyle(color: Colors.red),
// //                         textAlign: TextAlign.center,
// //                       ),

// //                     SizedBox(height: 20),

// //                     // Register button
// //                     ElevatedButton(
// //                       onPressed: _checkPhoneNumber,
// //                       child: _isLoading
// //                           ? CircularProgressIndicator()
// //                           : Text('Register'),
// //                       style: ElevatedButton.styleFrom(
// //                         padding: EdgeInsets.symmetric(vertical: 15),
// //                         backgroundColor: Colors.blue, // Same button color as in OTP page
// //                       ),
// //                     ),

// //                     // Navigation to login page
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.pushReplacementNamed(context, '/otpPage');
// //                       },
// //                       child: Text(
// //                         'Already have an account? Login here',
// //                         style: TextStyle(color: Colors.white),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }




























// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Controllers for text input
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   // Variables to manage UI state
//   bool _isLoading = false;
//   String _errorMessage = '';
//   String _verificationId = '';

//   // Function to check if the phone number or email is already registered
//   Future<void> _checkPhoneNumberAndEmail() async {
//     setState(() {
//       _isLoading = true;
//     });

//     String phoneNumber = _phoneController.text.trim();
//     String email = _emailController.text.trim();

//     try {
//       // Check if the email is already registered
//       List<String> methods = await _auth.fetchSignInMethodsForEmail(email);
//       if (methods.isNotEmpty) {
//         // Email is already registered
//         _showAlreadyRegisteredPopup('Email');
//         setState(() {
//           _isLoading = false;
//         });
//         return;
//       }

//       // Check if the phone number is already registered
//       await _auth.fetchSignInMethodsForEmail(phoneNumber).then((methods) {
//         if (methods.isNotEmpty) {
//           // Phone number is already registered
//           _showAlreadyRegisteredPopup('Phone Number');
//           setState(() {
//             _isLoading = false;
//           });
//         } else {
//           // Phone number is not registered, start OTP verification
//           _sendOTP();
//         }
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Failed to check phone number or email. Please try again.';
//       });
//     }
//   }

//   // Function to send OTP for phone verification
//   Future<void> _sendOTP() async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneController.text.trim(),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Auto-sign in when verification is complete
//         await _auth.signInWithCredential(credential);
//         Navigator.pushReplacementNamed(context, '/home');
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         setState(() {
//           _isLoading = false;
//           _errorMessage = e.message ?? 'Verification failed. Please try again.';
//         });
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           _verificationId = verificationId;
//           _isLoading = false;
//         });
//         Navigator.pushNamed(context, '/otpPage', arguments: verificationId);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }

//   // Show a popup message when the phone number or email is already registered
//   void _showAlreadyRegisteredPopup(String type) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('$type Already Registered'),
//         content: Text('This $type is already registered. Please log in.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/otpPage');
//             },
//             child: Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/ONBORADINGIMG.jpeg'), // Same background as OTP page
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.6), // Dark overlay to improve text visibility
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 80), // Adjust top space if needed
//                     Text(
//                       'Register with Phone Number',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // Text color to contrast with the background
//                       ),
//                     ),
//                     SizedBox(height: 20),

//                     // Name input field
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         hintText: 'Name',
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.9), // Slight transparency for input fields
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.name,
//                     ),
//                     SizedBox(height: 20),

//                     // Email input field
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.9), // Slight transparency for input fields
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(height: 20),

//                     // Phone number input field
//                     TextField(
//                       controller: _phoneController,
//                       decoration: InputDecoration(
//                         hintText: 'Phone Number',
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.9), // Slight transparency for input fields
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.phone,
//                     ),
//                     SizedBox(height: 20),

//                     // Error message
//                     if (_errorMessage.isNotEmpty)
//                       Text(
//                         _errorMessage,
//                         style: TextStyle(color: Colors.red),
//                         textAlign: TextAlign.center,
//                       ),

//                     SizedBox(height: 20),

//                     // Register button
//                     ElevatedButton(
//                       onPressed: _checkPhoneNumberAndEmail,
//                       child: _isLoading
//                           ? CircularProgressIndicator()
//                           : Text('Register'),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         backgroundColor: Colors.blue, // Same button color as in OTP page
//                       ),
//                     ),

//                     // Navigation to login page
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, '/loginPage');
//                       },
//                       child: Text(
//                         'Already have an account? Login here',
//                         style: TextStyle(color: Colors.white),
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






















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Controllers for text input
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   // Variables to manage UI state
//   bool _isLoading = false;
//   String _errorMessage = '';

//   // Function to check if the phone number or email is already registered
//   Future<void> _checkPhoneNumberAndEmail() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = ''; // Clear any previous error messages
//     });

//     String phoneNumber = _phoneController.text.trim();
//     String email = _emailController.text.trim();

//     try {
//       // Check if the email is already registered
//       List<String> emailMethods = await _auth.fetchSignInMethodsForEmail(email);
//       if (emailMethods.isNotEmpty) {
//         // Email is already registered
//         _showAlreadyRegisteredPopup('Email');
//         return;
//       }

//       // Check if the phone number is already registered
//       // This check is done using the email methods because Firebase does not have a direct method for phone numbers
//       // You will need to implement a different way to check for existing phone numbers, such as using Firestore
//       // Here we simulate a check with a dummy function, replace this with actual logic to check the phone
//       if (await _isPhoneNumberRegistered(phoneNumber)) {
//         _showAlreadyRegisteredPopup('Phone Number');
//         return;
//       }

//       // Proceed to registration (for example, create a user)
//       // _registerUser(phoneNumber, email); // Implement registration if needed
//       _showRegistrationSuccessPopup();
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Failed to check phone number or email. Please try again.';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Function to simulate phone number registration check
//   Future<bool> _isPhoneNumberRegistered(String phoneNumber) async {
//     // TODO: Replace with actual logic to check if phone number is registered
//     // For example, you can query Firestore or your database here
//     return false; // Assuming phone number is not registered
//   }

//   // Show a popup message when the phone number or email is already registered
//   void _showAlreadyRegisteredPopup(String type) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('$type Already Registered'),
//         content: Text('This $type is already registered. Please log in.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/loginPage');
//             },
//             child: Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Show success message for registration
//   void _showRegistrationSuccessPopup() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Registration Check Successful'),
//         content: Text('You are eligible to register with this phone number and email.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Navigate to OTP page or wherever needed
//               // For example:
//               // Navigator.pushNamed(context, '/otpPage');
//             },
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             // Background image
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/ONBORADINGIMG.jpeg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 color: Colors.black.withOpacity(0.6), // Dark overlay to improve text visibility
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 80), // Adjust top space if needed
//                         Text(
//                           'Register with Phone Number',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 20),
                      
//                         // Name input field
//                         TextField(
//                           controller: _nameController,
//                           decoration: InputDecoration(
//                             hintText: 'Name',
//                             filled: true,
//                             fillColor: Colors.white.withOpacity(0.9),
//                             border: OutlineInputBorder(),
//                           ),
//                           keyboardType: TextInputType.name,
//                         ),
//                         SizedBox(height: 20),
                      
//                         // Email input field
//                         TextField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             hintText: 'Email',
//                             filled: true,
//                             fillColor: Colors.white.withOpacity(0.9),
//                             border: OutlineInputBorder(),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                         SizedBox(height: 20),
                      
//                         // Phone number input field
//                         TextField(
//                           controller: _phoneController,
//                           decoration: InputDecoration(
//                             hintText: 'Phone Number',
//                             filled: true,
//                             fillColor: Colors.white.withOpacity(0.9),
//                             border: OutlineInputBorder(),
//                           ),
//                           keyboardType: TextInputType.phone,
//                         ),
//                         SizedBox(height: 20),
                      
//                         // Error message
//                         if (_errorMessage.isNotEmpty)
//                           Text(
//                             _errorMessage,
//                             style: TextStyle(color: Colors.red),
//                             textAlign: TextAlign.center,
//                           ),
                      
//                         SizedBox(height: 20),
                      
//                         // Register button
//                         ElevatedButton(
//                           onPressed: _isLoading ? null : _checkPhoneNumberAndEmail,
//                           child: _isLoading
//                               ? CircularProgressIndicator()
//                               : Text('Register'),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 15),
//                             backgroundColor: Colors.blue,
//                           ),
//                         ),
                      
//                         // Navigation to login page
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushReplacementNamed(context, '/otpPage');
//                           },
//                           child: Text(
//                             'Already have an account? Login here',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers for text input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Variables to manage UI state
  bool _isLoading = false;
  String _errorMessage = '';

  // Function to check if the email is already registered and proceed to registration
  Future<void> _checkEmailAndRegister() async {
    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Clear any previous error messages
    });

    String email = _emailController.text.trim();
    String name = _nameController.text.trim();
    String password = _passwordController.text.trim();
    String phone = _phoneController.text.trim();

    try {
      // Check if the email is already registered
      List<String> emailMethods = await _auth.fetchSignInMethodsForEmail(email);
      if (emailMethods.isNotEmpty) {
        // Email is already registered
        _showAlreadyRegisteredPopup();
        return;
      }

      // Register the user and store data in Firestore
      await _registerUser(email, password, name, phone);
      _showRegistrationSuccessPopup();
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to register. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Register the user in Firebase Auth and save data to Firestore
  Future<void> _registerUser(String email, String password, String name, String phone) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Registration failed. Please try again.';
      });
    }
  }

  // Show a popup message if the email is already registered
  void _showAlreadyRegisteredPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email Already Registered'),
        content: Text('This email is already registered. Please log in.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/loginPage');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  // Show success message for registration
  void _showRegistrationSuccessPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Registration Successful'),
        content: Text('Your account has been created successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/otpPage'); // Replace with your next page
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ONBORADINGIMG.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                color: Colors.black.withOpacity(0.6), // Dark overlay to improve text visibility
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80), // Adjust top space if needed
                        Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),

                        // Name input field
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 20),

                        // Email input field
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),

                        // Phone number input field
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20),

                        // Password input field
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),

                        // Error message
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),

                        SizedBox(height: 20),

                        // Register button
                        ElevatedButton(
                          onPressed: _isLoading ? null : _checkEmailAndRegister,
                          child: _isLoading
                              ? CircularProgressIndicator()
                              : Text('Register'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.blue,
                          ),
                        ),

                        // Navigation to login page
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Already have an account? Login here',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
