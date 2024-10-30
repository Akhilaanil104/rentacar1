// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? _name;
//   String? _email;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         setState(() {
//           _name = userDoc['name'];
//           _email = userDoc['email'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching user profile: $e');
//     }
//   }

//   Future<void> _logout() async {
//     await _auth.signOut();
//     Navigator.of(context).pushReplacementNamed('/onboard'); // Adjust route as needed
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color.fromARGB(255, 102, 114, 193),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Background color
//           Container(
//             color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.6),
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.3),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Center(
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: AssetImage('assets/images/user_avatar.png'),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           _name ?? 'Loading...', // Displays name or a loading placeholder
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           _email ?? 'Loading...', // Displays email or a loading placeholder
//                           style: TextStyle(
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stripe_payment_flutter/pages/mybooked_cars_page.dart';
// Import the BookedCarsPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          _name = userDoc['name'];
          _email = userDoc['email'];
        });
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    Navigator.of(context).pushReplacementNamed('/onboard'); // Adjust route as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 102, 114, 193),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background color
          Container(
            color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.6),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/user_avatar.png'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _name ?? 'Loading...', // Displays name or a loading placeholder
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _email ?? 'Loading...', // Displays email or a loading placeholder
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookedCarsPage()),
                      );
                    },
                    child: Text('View My Booked Cars'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 102, 114, 193),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
