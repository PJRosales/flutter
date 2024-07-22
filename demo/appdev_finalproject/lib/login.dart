import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file

class LoginScreen extends StatefulWidget { // Login screen stateful widget declaration
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage form state
  final TextEditingController _emailController = TextEditingController(); // Controller for the email input field
  final TextEditingController _passwordController = TextEditingController(); // Controller for the password input field
  bool _passwordVisible = false; // Variable to toggle password visibility

  String? _validateEmail(String? value) { // Function to validate email input
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email!';
    }
    return null;
  }

  String? _validatePassword(String? value) { // Function to validate password input
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'At least 8 characters long\n'
             'Include uppercase and lowercase\n'
             'Contain one number\n'
             'Contain one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login.png'), // Background image for the login screen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Card(
              color: Color.fromARGB(0, 255, 255, 255).withOpacity(0.6), // Semi-transparent card for form
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners for the card
              ),
              elevation: 1000,
              child: Padding(
                padding: const EdgeInsets.all(24.0), // Padding inside the card
                child: Form(
                  key: _formKey, // Attaching form key to the form
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo.png', // Logo image at the top of the form
                        width: 250, // Width of the logo
                        height: 150, // Height of the logo
                        fit: BoxFit.cover, // Ensuring the image fills the specified dimensions
                      ),
                      SizedBox(height: 50), // Space between logo and email field
                      Container(
                        width: 350, // Width of the email field
                        child: TextFormField(
                          controller: _emailController, // Controller for email input
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners for the email field
                            ),
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8), // Slightly transparent fill color
                          ),
                          validator: _validateEmail, // Email validation logic
                        ),
                      ),
                      SizedBox(height: 20), // Space between email and password fields
                      Container(
                        width: 350, // Width of the password field
                        child: TextFormField(
                          controller: _passwordController, // Controller for password input
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners for the password field
                            ),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8), // Slightly transparent fill color
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off, // Icon to toggle password visibility
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible; // Toggle password visibility
                                });
                              },
                            ),
                          ),
                          obscureText: !_passwordVisible, // Obscure text if password visibility is off
                          validator: _validatePassword, // Password validation logic
                        ),
                      ),
                      SizedBox(height: 50), // Space between password field and login button
                      Container(
                        width: 120, // Width of the login button
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Color.fromARGB(255, 145, 101, 228).withOpacity(0.8); // Hover color for login button
                                }
                                return Color.fromARGB(255, 185, 127, 229); // Normal color for login button
                              },
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Font color for login button
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 13.0), // Vertical padding for login button
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 18), // Font size for login button text
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) { // Check if form input is valid
                              if (_emailController.text == 'gwenalexa@gmail.com' &&
                                  _passwordController.text == 'Gwenalexa*04') { // Hardcoded valid email and password check
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoadingScreen(), // Navigate to loading screen
                                  ),
                                );

                                await Future.delayed(Duration(seconds: 3)); // Delay for 3 seconds

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavigationBarExample(), // Navigate to main screen
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Error'), // Error dialog title
                                      content: Text('Invalid email or password!'), // Error dialog content
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close error dialog
                                          },
                                          child: Text('OK'), // Error dialog button
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                          child: Text('Log in'), // Text on the login button
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
    );
  }
}

class LoadingScreen extends StatelessWidget { // Loading screen widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Circular progress indicator
      ),
    );
  }
}
