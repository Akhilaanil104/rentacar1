// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class BookedCarsPage extends StatefulWidget {
//   @override
//   _BookedCarsPageState createState() => _BookedCarsPageState();
// }

// class _BookedCarsPageState extends State<BookedCarsPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   List<Map<String, dynamic>> _bookedCars = []; // List to store booked cars

//   @override
//   void initState() {
//     super.initState();
//     _fetchBookedCars();
//   }

//   Future<void> _fetchBookedCars() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         // Fetch user profile
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         // Fetch booked cars
//         List bookedCarIds = userDoc['bookedCars'] ?? []; // Assuming bookedCars is a list of car IDs
//         for (String carId in bookedCarIds) {
//           DocumentSnapshot carDoc = await FirebaseFirestore.instance
//               .collection('orders') // Assuming cars collection
//               .doc(carId)
//               .get();
//           _bookedCars.add({
//             'name': carDoc['name'],
//             'type': carDoc['type'],
//             'imageUrl': carDoc['imageUrl'], // Add imageUrl for car image display
//           });
//         }

//         setState(() {});
//       }
//     } catch (e) {
//       print('Error fetching booked cars: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Booked Cars'),
//         backgroundColor: Color.fromARGB(255, 102, 114, 193),
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
//               child: _bookedCars.isEmpty
//                   ? Center(
//                       child: Text(
//                         'No booked cars found.',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: _bookedCars.length,
//                       itemBuilder: (context, index) {
//                         final car = _bookedCars[index];
//                         return Card(
//                           color: Colors.black54,
//                           margin: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: ListTile(
//                             leading: Image.network(
//                               car['imageUrl'],
//                               width: 50,
//                               fit: BoxFit.cover,
//                             ),
//                             title: Text(
//                               car['name'],
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             subtitle: Text(
//                               car['type'],
//                               style: TextStyle(color: Colors.white70),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
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

class BookedCarsPage extends StatefulWidget {
  @override
  _BookedCarsPageState createState() => _BookedCarsPageState();
}

class _BookedCarsPageState extends State<BookedCarsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> _bookedCars = []; // List to store booked car orders

  @override
  void initState() {
    super.initState();
    _fetchBookedCars();
  }

  Future<void> _fetchBookedCars() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Fetch booked cars directly from the 'orders' subcollection
        final ordersSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('orders')
            .get();

        // Extract car details from each order document
        for (var order in ordersSnapshot.docs) {
          _bookedCars.add(order.data());
        }

        setState(() {}); // Update UI
      }
    } catch (e) {
      print('Error fetching booked cars: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booked Cars'),
        backgroundColor: Color.fromARGB(255, 102, 114, 193),
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
              child: _bookedCars.isEmpty
                  ? Center(
                      child: Text(
                        'No booked cars found.',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _bookedCars.length,
                      itemBuilder: (context, index) {
                        final car = _bookedCars[index];
                        return Card(
                          color: Colors.black54,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: car['imageUrl'] != null
                                ? Image.network(
                                    car['imageUrl'],
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.directions_car, color: Colors.white),
                            title: Text(
                              car['carName'] ?? 'Car Name',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Type: ${car['type'] ?? 'N/A'}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  'Pickup Location: ${car['pickupLocation'] ?? 'N/A'}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  'Price: \$${car['price'] ?? '0'}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                if (car['startDate'] != null && car['endDate'] != null)
                                  Text(
                                    'Duration: ${car['startDate']} to ${car['endDate']}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
