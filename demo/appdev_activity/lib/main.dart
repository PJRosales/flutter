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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFE2CDF4), // Set scaffold background color to violet
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFE2CDF4), // Set app bar background color to violet
          foregroundColor: Colors.black, // Change this if you want a different text color on the app bar
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black, // Change this if you want a different color for the FAB
        ),
      ),
      home: MyProfilePage(),
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
          title: Text('My Information'),
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
        bottomNavigationBar: Container(
          color: Color(0XFFC89EFF), // Set the navigation bar color to pink
          child: TabBar(
            labelColor: Colors.black, // Set the selected icon color to black
            unselectedLabelColor: Colors.black, // Set the unselected icon color to black
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Personal Info'),
              Tab(icon: Icon(Icons.school), text: 'Education'),
              Tab(icon: Icon(Icons.build), text: 'Skills'),
              Tab(icon: Icon(Icons.star), text: 'Interests'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
            ],
            indicatorColor: Colors.black, // Optional: Change the indicator color
          ),
        ),
      ),
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
            'Nadine Garrovillas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Passionate about technology and eager to innovate, with a focus on AI and machine learning research.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              _buildInfoCard(Icons.person, 'Fullname', 'Alliya Drew Nadine Garrovillas'),
              SizedBox(height: 8),
              _buildInfoCard(Icons.location_city, 'Address', 'Batangas City'),
              SizedBox(height: 8),
              _buildInfoCard(Icons.cake, 'Birthdate', 'August 20, 2000'),
              SizedBox(height: 8),
              _buildInfoCard(Icons.calendar_today, 'Age', '23 years/old'),
              SizedBox(height: 8),
              _buildInfoCard(Icons.female, 'Sex', 'Female'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String text) {
    return Card(
      elevation: 10, // Shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      color: Color(0xFFEADCF0), // Background color of the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Bold title
                ),
                Text(text),
              ],
            ),
          ],
        ),
      ),
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
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Kumintang Elementary School',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Kumintang, Batangas City, 2015'),
            ),
          ),
        ),
         Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Banaba West Integrated High School',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Banaba West, Batangas City, 2019'),
            ),
          ),
        ),
         Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Science, Technology, Engineering, and Mathematics',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('AMA Computer College, Batangas City, 2021'),
            ),
          ),
        ),
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: SizedBox(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(
                'Bachelor of Science in Information Technology',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Batangas State University, Alangilan, 2025'),
            ),
          ),
        ),
      ],
    );
  }
}

// Skills Tab
class SkillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: Container(
            height: 100, // Adjust the height as needed
            width: double.infinity, // Full width
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text(
                'Programming Languages',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Dart, Java, Python'),
            ),
          ),
        ),
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text(
                'Web Development',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('HTML, CSS, JavaScript, Flutter'),
            ),
          ),
        ),
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(
                'Certifications',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text("Dean's Lister: 1st and 3rd Year College"),
            ),
          ),
        ),
      ],
    );
  }
}

//Interest Tab
class InterestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: Container(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.science),
              title: Text(
                'Artificial Intelligence',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Research in Machine Learning'),
            ),
          ),
        ),
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Color(0xFFEADCF0), // Background color of the card
          child: Container(
            height: 100, // Adjust height as needed
            width: double.infinity, // Full width
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text(
                'Publications',
                style: TextStyle(fontWeight: FontWeight.bold), // Bold title
              ),
              subtitle: Text('Author of several research papers on Web Development, AI, and ML'),
            ),
          ),
        ),
      ],
    );
  }
}

//Contact Tab
class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildContactCard(
          icon: Icons.email,
          title: 'Email',
          subtitle: 'nadinegarrovillas@gmail.com',
        ),
        _buildContactCard(
          icon: Icons.phone,
          title: 'Phone',
          subtitle: '0923 466 2345',
        ),
        _buildContactCard(
          icon: Icons.facebook,
          title: 'Facebook',
          subtitle: 'Drew Nadine',
        ),
        _buildContactCard(
          icon: Icons.camera,
          title: 'Instagram',
          subtitle: '@Nadine_Garrovillas',
        ),
        _buildContactCard(
          icon: Icons.link,
          title: 'LinkedIn',
          subtitle: 'https://www.linkedin.com/in/alliya-drew-nadine-garrovillas-78927a319/',
        ),
      ],
    );
  }

  Widget _buildContactCard({required IconData icon, required String title, required String subtitle}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Color(0xFFEADCF0), // Background color of the card
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold), // Bold title
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
