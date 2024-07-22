import 'package:flutter/material.dart';

void main() {
  runApp(MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFCDDEE6),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black, // Change this if you want a different text color on the app bar
          backgroundColor: const Color(0xFF7296A4), // Set the background color here
        ),
      ),
      home: MyProfilePage(),
    );
  }
}

// Information Tab
class PersonalInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double avatarRadius = 60.0; // Adjust the radius as needed
    final double containerSize = avatarRadius * 2; // Size of the container

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the top
        children: [
          SizedBox(height: 30),
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: Colors.black, // Background color of the border
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('images/profile.png'), // Add your image asset here
            ),
          ),
          SizedBox(height: 20),
          Text(
            'PJ Rosales',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "I'm passionate about learning and exploring new ideas, with a love for technology and problem-solving.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Container(
            width: 490, // Set the desired width for the card
            child: Card(
              color: const Color(0xFFE6F0F2), // Background color for the card
              elevation: 10, // Shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(Icons.person, ' Patrick Jerome R. Rosales'),
                    SizedBox(height: 8),
                    _buildInfoRow(Icons.location_city, ' Batangas City'),
                    SizedBox(height: 8),
                    _buildInfoRow(Icons.cake, ' November 04, 2002'),
                    SizedBox(height: 8),
                    _buildInfoRow(Icons.calendar_today, ' 21 years/old'),
                    SizedBox(height: 8),
                    _buildInfoRow(Icons.female, ' Male'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}

// Education Tab
class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Banaba South Elementary School',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Bnaba South, Batangas City, 2015'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Banaba West Integrated High School',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Banaba West, Batangas City, 2019'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'AMA Computer College',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Bolbok, Batangas City, 2021'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Bachelor of Science in Information Technology',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Batangas State University, Alangilan, 2025'),
            ),
          ),
        ),
      ],
    );
  }
}

class SkillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 100, // Adjust the height as needed
            width: double.infinity, // Full width
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text(
                'Programming Languages',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Dart, Java, Python, Php'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text(
                'Web Development',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('HTML, CSS, JavaScript, Flutter, MySql'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(
                'Certifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text(
                "Dean's Lister: 1st Year & 3rd Year College, Batangas State University"),
            ),
          ),
        ),
      ],
    );
  }
}

class InterestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.science),
              title: Text(
                'Artificial Intelligence',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Research in Machine Learning and Web Development'),
            ),
          ),
        ),
        Card(
          color: const Color(0xFFE6F0F2), // Background color for the card
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text(
                'Publications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Adjust font size as needed
                ),
              ),
              subtitle: Text('Author of several research papers on AI and ML'),
            ),
          ),
        ),
      ],
    );
  }
}

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildContactCard(
          icon: Icons.email,
          title: 'Email',
          subtitle: 'pjrosales@gmail.com',
        ),
        _buildContactCard(
          icon: Icons.phone,
          title: 'Phone',
          subtitle: '0934 862 5422',
        ),
        _buildContactCard(
          icon: Icons.facebook,
          title: 'Facebook',
          subtitle: 'PJ Rosales',
        ),
        _buildContactCard(
          icon: Icons.camera,
          title: 'Instagram',
          subtitle: '@PJ_Rosales',
        ),
      ],
    );
  }

  Widget _buildContactCard(
      {required IconData icon, required String title, required String subtitle}) {
    return Card(
      color: const Color(0xFFE6F0F2), // Background color for the card
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          bottom: TabBar(
            labelColor: Colors.black, // Change color of selected tab text
            tabs: [
              Tab(
                icon: Icon(Icons.person, color: Colors.black), // Change color here
                text: 'Personal Info',
              ),
              Tab(
                icon: Icon(Icons.school, color: Colors.black), // Change color here
                text: 'Education',
              ),
              Tab(
                icon: Icon(Icons.build, color: Colors.black), // Change color here
                text: 'Skills',
              ),
              Tab(
                icon: Icon(Icons.star, color: Colors.black), // Change color here
                text: 'Interests',
              ),
              Tab(
                icon: Icon(Icons.contact_mail, color: Colors.black), // Change color here
                text: 'Contact',
              ),
            ],
            indicatorColor: Colors.black, // Optional: Change the indicator color
          ),
        ),
        body: TabBarView(
          children: [
            PersonalInfoTab(),
            EducationTab(),
            SkillsTab(),
            InterestsTab(),
            ContactTab(),
          ],
        ),
      ),
    );
  }
}
