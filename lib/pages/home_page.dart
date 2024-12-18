




import 'cardetails_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final CollectionReference carsRef = FirebaseFirestore.instance.collection('cars');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent a Car'),
        backgroundColor: Color.fromARGB(255, 102, 114, 193),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications page
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
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
            color: Colors.black.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for cars near you',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                    onChanged: (value) {
                      // Handle search logic here
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Available Cars',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: carsRef.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text("No cars available"));
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var carData = snapshot.data!.docs[index];
                            return CarCard(carData: carData);
                          },
                        );
                      },
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

class CarCard extends StatelessWidget {
  final QueryDocumentSnapshot carData;

  CarCard({required this.carData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white.withOpacity(0.9),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CarDetailsPage(car: carData),
  ),
);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CarDetailsPage(car: carData),
            //   ),
            // );
          },
          child: Hero(
            tag: carData['imageUrl'],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                carData['imageUrl'],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          carData['name'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${carData['location']}'),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(' ${carData['rating']}', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to car details or booking page
          },
          child: Text('Book Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 102, 114, 193),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
