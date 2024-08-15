import 'package:cheez/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(8.0);
    final buttonHeight = 48.0; // Set the height you want for the buttons

    final loginState = ref.watch(loginStateProvider);

    ref.listen<AsyncValue<void>>(loginStateProvider, (previous, next) {
      // Handle navigation or show error messages
      if (next is AsyncData) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (next is AsyncError) {
        // Show error as a snackbar or alert dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Color(0xFFF5F5F5), // AppBar background color
        elevation: 0, // Optional: to remove shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0, // Font size of the text
                fontWeight: FontWeight.bold, // Font weight of the text
              ),
            ),
            SizedBox(height: 20), // Add some space between the text and the TextFields

// Email Field
Container(
  height: buttonHeight, // Set the height of the TextField container
  child: TextField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0, // Adjust vertical padding to match button height
        horizontal: 16.0, // Adjust horizontal padding (left and right)
      ),
      hintText: 'Enter email',
      hintStyle: TextStyle(color: Colors.grey[400]), // Placeholder text color
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!), // Border color
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!), // Border color when enabled
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF45B666), width: 2.0), // Border color when focused
        borderRadius: borderRadius,
      ),
    ),
  ),
),
SizedBox(height: 20),

// Password Field
Container(
  height: buttonHeight, // Set the height of the TextField container
  child: TextField(
    controller: _passwordController,
    obscureText: true, // Hide password input
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0, // Adjust vertical padding to match button height
        horizontal: 16.0, // Adjust horizontal padding (left and right)
      ),
      hintText: 'Enter password',
      hintStyle: TextStyle(color: Colors.grey[400]), // Placeholder text color
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!), // Border color
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!), // Border color when enabled
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF45B666), width: 2.0), // Border color when focused
        borderRadius: borderRadius,
      ),
    ),
  ),
),

// Add margin after Password field
SizedBox(height: 30), // Adjust height for the margin

            // Login Button
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity, // Set the width to match the TextFields
                child: ElevatedButton(
                  onPressed: () async {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    if (email.isNotEmpty && password.isNotEmpty) {
                     await ref.read(loginStateProvider.notifier).login(email, password);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF45B666), // Button color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: Size.fromHeight(buttonHeight), // Set the height of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius, // Match the border radius
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Google Login Button
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity, // Set the width to match the TextFields
                child: ElevatedButton(
                  onPressed: () {
                    _handleGoogleSignIn(context); // Pass context to the method
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF45B666)), // Green border color
                    foregroundColor: Color(0xFF45B666), // Text color
                    backgroundColor: Color(0xFFF5F5F5), // Background color
                    minimumSize: Size.fromHeight(buttonHeight), // Set the height of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius, // Match the border radius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                        width: 24, // Adjust the size as needed
                        height: 24, // Adjust the size as needed
                      ),
                      SizedBox(width: 8), // Space between icon and text
                      Text('Login with Google'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        // Handle successful sign-in
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      // Handle error
      print('Google Sign-In error: $error');
    }
  }
}
