import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentScreen(), // Sets the home screen of the app to AppointmentScreen
    );
  }
}

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Creates a tab controller with 2 tabs
      child: Scaffold(
        backgroundColor: Colors.white, // Sets the background color of the scaffold
        appBar: AppBar(
          title: Text(
            'APPOINTMENT',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Sets the title font weight to bold
            ),
          ),
          backgroundColor: Colors.white, // Sets the background color of the AppBar
          foregroundColor: Colors.black, // Sets the text color in the AppBar
          bottom: TabBar(
            labelColor: Colors.black, // Sets the color of selected tab labels
            unselectedLabelColor: Colors.black, // Sets the color of unselected tab labels
            indicatorColor: Colors.pinkAccent, // Sets the color of the tab indicator
            tabs: [
              Tab(text: 'In Progress'), // Creates a tab labeled 'In Progress'
              Tab(text: 'Approved'), // Creates a tab labeled 'Approved'
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: List.generate(20, (index) {
                  return AppointmentCard(
                    title: getInProgressTitle(index), // Generates a title for 'In Progress' tab
                    dateTime: getRandomDate(index, false), // Generates a random date for 'In Progress' tab
                    price: getInProgressPrice(index), // Generates a price for 'In Progress' tab
                    isApproved: false, // Sets the appointment as not approved
                  );
                }),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(15, (index) {
                  return AppointmentCard(
                    title: getApprovedTitle(index), // Generates a title for 'Approved' tab
                    dateTime: getApprovedDate(index), // Generates a date for 'Approved' tab
                    price: getApprovedPrice(index), // Generates a price for 'Approved' tab
                    isApproved: true, // Sets the appointment as approved
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getInProgressTitle(int index) {
    final titles = [
      'Deep Cleansing Facial',
      // List of titles for 'In Progress' appointments
    ];
    return titles[index % titles.length]; // Returns a title based on the index
  }

  String getRandomDate(int index, bool isApproved) {
    final baseDate = DateTime.now().add(Duration(days: index * 2)); // Calculates a base date
    final random = Random();
    final hour = 10 + random.nextInt(10); // Generates a random hour between 10 AM and 7 PM
    final minute = random.nextInt(60); // Generates a random minute
    final period = hour >= 12 ? 'PM' : 'AM'; // Determines AM or PM
    final formattedHour = hour > 12 ? hour - 12 : hour; // Formats the hour
    return '${baseDate.month.toString().padLeft(2, '0')}/${baseDate.day.toString().padLeft(2, '0')}/${baseDate.year} ${formattedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period'; // Formats and returns the date
  }

  String getInProgressPrice(int index) {
    return 'P ${2088 + index * 20}.00'; // Calculates and returns a price for 'In Progress' appointments
  }

  String getApprovedTitle(int index) {
    final titles = [
      'Luxury Skin Revitalization',
      // List of titles for 'Approved' appointments
    ];
    return titles[index % titles.length]; // Returns a title based on the index
  }

  String getApprovedDate(int index) {
    final baseDate = DateTime.now().subtract(Duration(days: index * 2)); // Calculates a base date
    final random = Random();
    final hour = 10 + random.nextInt(10); // Generates a random hour between 10 AM and 7 PM
    final minute = random.nextInt(60); // Generates a random minute
    final period = hour >= 12 ? 'PM' : 'AM'; // Determines AM or PM
    final formattedHour = hour > 12 ? hour - 12 : hour; // Formats the hour
    return '${baseDate.month.toString().padLeft(2, '0')}/${baseDate.day.toString().padLeft(2, '0')}/${baseDate.year} ${formattedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period'; // Formats and returns the date
  }

  String getApprovedPrice(int index) {
    return 'P ${1888 + index * 15}.00'; // Calculates and returns a price for 'Approved' appointments
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String price;
  final bool isApproved;

  AppointmentCard({required this.title, required this.dateTime, required this.price, required this.isApproved});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sets the elevation of the card
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFFF7F9D), width: 2), // Sets the border color and width
        borderRadius: BorderRadius.circular(8), // Sets the border radius of the card
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Sets the margin around the card
      color: Colors.white, // Sets the background color of the card
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Sets the padding inside the card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children in a row with space between them
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children in the column to the start
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Sets the font weight to bold
                  ),
                ),
                SizedBox(height: 4), // Adds space between text widgets
                Text(
                  dateTime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // Sets the text color to grey
                  ),
                ),
                SizedBox(height: 4), // Adds space between text widgets
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black, // Sets the text color to black
                  ),
                ),
              ],
            ),
            if (isApproved) Icon(Icons.check, color: Colors.green), // Displays a check icon if the appointment is approved
            if (!isApproved)
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit), // Displays an edit icon button
                    onPressed: () {
                      // Edit action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete), // Displays a delete icon button
                    onPressed: () {
                      // Delete action
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
