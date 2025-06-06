import 'package:aqua/pages/User/DetailCard.dart';
import 'package:aqua/pages/User/Details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <--- NEW: Import shared_preferences

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Quality',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // <--- NEW: Declare the state variable to hold the username ---
  String _loggedInUsername = 'Guest'; // Default value until fetched

  @override
  void initState() {
    super.initState();
    _loadUsername(); // <--- NEW: Call the function to load username when the widget initializes
  }

  // <--- NEW: Function to load the username from SharedPreferences ---
  Future<void> _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve the username using the key 'loggedInUsername'
      // Use 'Guest' as a fallback if no username is found
      _loggedInUsername = prefs.getString('loggedInUsername') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // <--- MODIFIED: Use the state variable here ---
                    'Hi, $_loggedInUsername',
                    style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                Container(
                  height: 70, // Increased height for better vertical spacing
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 27, 123, 201),
                  ),
                  padding: const EdgeInsets.only(
                    left: 10,
                  ), // Padding on left and right
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Vertically center the texts
                        children: const [
                          Text(
                            'Total Establishments',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 4), // Spacing between the two texts
                          Text(
                            '125',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.window_outlined, // You can use any icon here
                        color: Colors.white,
                        size: 100,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Spacing between the two containers

                Container(
                  height: 70, // Increased height for better vertical spacing
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 75, 202, 140),
                  ),
                  padding: const EdgeInsets.only(
                    left: 10,
                  ), // Padding on left and right
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Vertically center the texts
                        children: const [
                          Text(
                            'Total Sensors',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 4), // Spacing between the two texts
                          Text(
                            '125',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.sensors_rounded, // You can use any icon here
                        color: Colors.white,
                        size: 100,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10), // Spacing between the two containers

                Container(
                  height: 70, // Increased height for better vertical spacing
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.redAccent),
                  padding: const EdgeInsets.only(
                    left: 10,
                  ), // Padding on left and right
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Vertically center the texts
                        children: const [
                          Text(
                            'Total Users',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 4), // Spacing between the two texts
                          Text(
                            '125',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.people_alt_outlined, // You can use any icon here
                        color: Colors.white,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            DetailCard(
              title: 'Home Water Tank',
              quality: 'Good',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),

            DetailCard(
              title: 'School Water Tank',
              quality: 'Good',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),

            DetailCard(
              title: 'Apartment Water Tank',
              quality: 'Good',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),

            DetailCard(
              title: 'Store Water Tank',
              quality: 'Good',
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}