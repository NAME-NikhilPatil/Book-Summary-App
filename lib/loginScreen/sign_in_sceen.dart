import 'package:books_demo/HomeScreen/homescreen.dart';
import 'package:books_demo/components/button.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:books_demo/loginScreen/login_screen.dart';
import 'package:books_demo/navigationBar/navigatin_bar.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Top Bar with Title and Skip button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LOL Books',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              // Image
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/splash1.png', // Replace with your asset image path
                  height: 200,
                ),
              ),
              const SizedBox(height: 24.0),
              // Title
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Let's start your ",
                    style: const TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'fun',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' & '),
                      TextSpan(
                        text: 'easy',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' growth!'),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 24.0),
              // Subtitle
              const Text(
                'Sign up to personalize your experience and save your progress',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30.0),
              // Privacy Policy
              const Center(
                child: Text(
                  'By continuing, you agree to our Privacy Policy and Terms &Conditions',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Kbutton(
                text: "Continue with Google",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation_Bar()),
                  );
                },
                icon: Icons.g_mobiledata,
              ),
              // Other Sign-in Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSignInButton(
                    icon: Icons.facebook,
                    onPressed: () {
                      // Handle Facebook sign in
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  _buildSignInButton(
                    icon: Icons.apple,
                    onPressed: () {
                      // Handle Apple sign in
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  _buildSignInButton(
                    icon: Icons.email,
                    onPressed: () {
                      // Handle Email sign in
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // This makes the button square
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        backgroundColor: const Color(0xFFE0E0E0), // Button background color
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
