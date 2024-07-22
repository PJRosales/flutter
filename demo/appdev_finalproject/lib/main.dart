import 'package:flutter/material.dart';
import 'login.dart';
import 'appointment_screen.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => BottomNavigationBarExample(),
      },
    );
  }
}
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  late bool isDesktop;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AppointmentScreen(),
    ProfilePage(),
  ];

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  isDesktop = screenWidth > 700;

  return WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Dermacare',
          style: GoogleFonts.notoSerif(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: isDesktop
          ? Container(
              width: 250, // Adjust the width here
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey[300]!, // Gray color for the right border
                    width: 1.0, // Adjust the width of the border if needed
                  ),
                ),
              ),
              child: Drawer(
                child: Container(
                  color: Colors.white, // Set background color of the drawer
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Center(
                        child: Image.asset(
                          'images/logo.png',
                          width: 300, // Adjust the width here
                          height: 150, // Adjust the height here
                        ),
                      ),
                      Divider(color: Colors.grey[300]),
                      SizedBox(height: 20),
                      _buildDrawerItem(
                        icon: Icons.home,
                        title: 'Home',
                        index: 0,
                      ),
                      Divider(color: Colors.grey[300]),
                      SizedBox(height: 20),
                      _buildDrawerItem(
                        icon: Icons.calendar_today,
                        title: 'Appointment',
                        index: 1,
                      ),
                      Divider(color: Colors.grey[300]),
                      SizedBox(height: 20),
                      _buildDrawerItem(
                        icon: Icons.person,
                        title: 'Profile',
                        index: 2,
                      ),
                      Divider(color: Colors.grey[300]),
                    ],
                  ),
                ),
              ),
            )
          : null,
      drawerScrimColor: Colors.transparent, // Optional: To control scrim color
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 15),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today, size: 15),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 15),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.pinkAccent,
              onTap: _onItemTapped,
            ),
    ),
  );
}


  Widget _buildDrawerItem({required IconData icon, required String title, required int index}) {
    final isSelected = _selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.pinkAccent : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.pinkAccent : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return DesktopHomeScreen();
        } else {
          return MobileHomeScreen();
        }
      },
    );
  }
}

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/derma.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildServiceCard(context, 'Slimming Combo Deal', 'P 2,088.00'),
                _buildServiceCard(context, 'Cinderella Drip', 'P 2,088.00'),
                _buildServiceCard(context, 'Underarm Combo Deal', 'P 3,888.00'),
                _buildServiceCard(context, 'Facial Slimming Deal', 'P 888.00'),
                _buildServiceCard(context, 'Diamond Peel', 'P 599.00'),
                _buildServiceCard(context, 'Glow Up Package', 'P 15,000.00'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String price) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Color(0xFFFF7F9D),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () => _showServiceInfo(context, title, price),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7F9D),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ).copyWith(
                elevation: MaterialStateProperty.all(5.0),
                shadowColor: MaterialStateProperty.all(Colors.pink.shade200),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) return Colors.pinkAccent;
                    return null;
                  },
                ),
              ),
              child: const Text('Book'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBookingSuccessful(BuildContext context, String title, String price, String date, String time) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color(0xFFFF7F9D),
            width: 2.0,
          ),
        ),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Book Successful!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              '$price',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Date: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Time: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFFF7F9D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.pinkAccent.withOpacity(0.3);
                    }
                    return null;
                  },
                ),
              ),
              child: const Text('Okay'),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> _showServiceInfo(BuildContext context, String title, String price) async {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Color(0xFFFF7F9D),
                width: 2.0,
              ),
            ),
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Icon(Icons.info_outline, color: Colors.black54, size: 30.0),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Select Schedule:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedDate != null
                              ? '${selectedDate!.toLocal()}'.split(' ')[0]
                              : '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.access_time),
                            onPressed: () async {
                              final TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: selectedTime ?? TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  selectedTime = pickedTime;
                                });
                              }
                            },
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedTime != null
                              ? '${selectedTime!.format(context)}'
                              : '',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFFF7F9D), width: 2.0),
                ).copyWith(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.pinkAccent.withOpacity(0.1);
                      return null;
                    },
                  ),
                ),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (selectedDate != null && selectedTime != null) {
                    final String date = '${selectedDate!.toLocal()}'.split(' ')[0];
                    final String time = selectedTime!.format(context);
                    Navigator.of(context).pop();
                    _showBookingSuccessful(context, title, price, date, time);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFF7F9D),
                ).copyWith(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.pinkAccent.withOpacity(0.3);
                      return null;
                    },
                  ),
                ),
                child: const Text('Book'),
              ),
            ],
          );
        },
      );
    },
  );
}
}
class DesktopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/derma.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
   const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildServiceCard(context, 'Slimming Combo Deal', 'P 2,088.00'),
                  _buildServiceCard(context, 'Cinderella Drip', 'P 2,088.00'),
                  _buildServiceCard(context, 'Underarm Combo Deal', 'P 3,888.00'),
                  _buildServiceCard(context, 'Facial Slimming Deal', 'P 888.00'),
                  _buildServiceCard(context, 'Diamond Peel', 'P 599.00'),
                  _buildServiceCard(context, 'Glow Up Package', 'P 15,000.00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String price) {
    return Container(
      width: 300,
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Color(0xFFFF7F9D),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _showServiceInfo(context, title, price),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7F9D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).copyWith(
                  elevation: MaterialStateProperty.all(5.0),
                  shadowColor: MaterialStateProperty.all(Colors.pink.shade200),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.pinkAccent;
                      return null;
                    },
                  ),
                ),
                child: const Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showBookingSuccessful(BuildContext context, String title, String price, String date, String time) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color(0xFFFF7F9D),
            width: 2.0,
          ),
        ),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Book Successful!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              '$price',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Date: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Time: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFFF7F9D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.pinkAccent.withOpacity(0.3);
                    }
                    return null;
                  },
                ),
              ),
              child: const Text('Okay'),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> _showServiceInfo(BuildContext context, String title, String price) async {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Color(0xFFFF7F9D),
                width: 2.0,
              ),
            ),
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Icon(Icons.info_outline, color: Colors.black54, size: 30.0),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Select Schedule:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedDate != null
                              ? '${selectedDate!.toLocal()}'.split(' ')[0]
                              : '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.access_time),
                            onPressed: () async {
                              final TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: selectedTime ?? TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  selectedTime = pickedTime;
                                });
                              }
                            },
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedTime != null
                              ? '${selectedTime!.format(context)}'
                              : '',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFFF7F9D), width: 2.0),
                ).copyWith(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.pinkAccent.withOpacity(0.1);
                      return null;
                    },
                  ),
                ),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (selectedDate != null && selectedTime != null) {
                    final String date = '${selectedDate!.toLocal()}'.split(' ')[0];
                    final String time = selectedTime!.format(context);
                    Navigator.of(context).pop();
                    _showBookingSuccessful(context, title, price, date, time);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFF7F9D),
                ).copyWith(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) return Colors.pinkAccent.withOpacity(0.3);
                      return null;
                    },
                  ),
                ),
                child: const Text('Book'),
              ),
            ],
          );
        },
      );
    },
  );
}
}