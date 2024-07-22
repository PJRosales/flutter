import 'package:flutter/material.dart';
import 'login.dart'; 
import 'dart:math';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        // Removed leading property to remove the back navigation button
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/profile.png'), // Replace with your profile image
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Gwen Alexa Cipriano', // Replace with user's name
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'gwenalexa@gmail.com', // Replace with user's email
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ProfileMenuItem(
                icon: Icons.account_circle,
                text: 'Account',
                onTap: () {
                  // Implement your onTap functionality here
                  print('Tapped Account');
                },
              ),
              Divider(color: Colors.grey[300]),
              ProfileMenuItem(
                icon: Icons.info,
                text: 'My Information',
                onTap: () {
                  // Implement your onTap functionality here
                  print('Tapped My Information');
                },
              ),
              Divider(color: Colors.grey[300]),
              ProfileMenuItem(
                icon: Icons.history,
                text: 'History',
                onTap: () {
                  // Opens the modal bottom sheet without a close button
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HistoryPopup();
                    },
                  );
                },
              ),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 50),
              ProfileMenuItem(
                icon: Icons.contacts,
                text: 'Contacts',
                onTap: () {
                  // Implement your onTap functionality here
                  print('Tapped Contacts');
                },
              ),
              Divider(color: Colors.grey[300]),
              ProfileMenuItem(
                icon: Icons.logout,
                text: 'Log Out',
                onTap: () {
                  // Implement your onTap functionality here
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
              ),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.black),
                  SizedBox(width: 16),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(30, (index) => HistoryItem(
                title: _getRandomTitle(),
                dateTime: _getRandomDate(),
              )),
            ),
          ),
        ],
      ),
    );
  }

  String _getRandomTitle() {
    final titles = [
      'Acne Treatment',
      'Anti-Aging Facial',
      'Hydrating Facial',
      'Brightening Peel',
      'Detox Mask',
      'Microdermabrasion',
      'Chemical Peel',
      'Collagen Boost',
      'Skin Resurfacing',
      'Body Scrub',
      'Cellulite Treatment',
      'Stretch Mark Therapy',
      'Skin Tightening',
      'Laser Hair Removal',
      'HydraFacial',
      'Oxygen Facial',
      'Laser Skin Rejuvenation',
      'Moisturizing Treatment',
      'Exfoliating Scrub',
      'Body Wrap',
      'Anti-Cellulite Wrap',
      'Firming Facial',
      'Toning Facial',
      'Deep Cleansing Facial',
      'Rosacea Treatment',
      'Sun Damage Repair',
      'Neck and Décolleté Treatment',
      'Facial Massage',
      'Glycolic Peel',
      'Brightening Facial',
      'Skin Purification',
      'Detox Facial'
    ];
    return titles[Random().nextInt(titles.length)];
  }

  String _getRandomDate() {
    final random = Random();
    final years = List.generate(4, (i) => 2020 + i);
    final year = years[random.nextInt(years.length)];
    final month = random.nextInt(12) + 1;
    final day = random.nextInt(28) + 1;

    final hour = 10 + random.nextInt(10); // Random hour between 10 AM and 7 PM (10 hours range)
    final minute = random.nextInt(60); // Random minute
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour > 12 ? hour - 12 : hour;

    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/$year ${formattedHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}

class HistoryItem extends StatelessWidget {
  final String title;
  final String dateTime;

  const HistoryItem({
    Key? key,
    required this.title,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dateTime,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Icon(Icons.info, color: Colors.black),
        ],
      ),
    );
  }
}
