import 'package:books_demo/HomeScreen/homescreen.dart';
import 'package:books_demo/components/button.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:books_demo/singUpScreen/create_account.dart';
import 'package:books_demo/navigationBar/navigatin_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferences? prefs;

  bool visible = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((var user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
        }
      }
    });
  }

  Future<void> signIn(BuildContext context) async {
    if (kDebugMode) {
      print("function called");
    }

    try {
      setState(() {
        isLoading = true;
      });

      User? user;
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      user = result.user;

      prefs = await SharedPreferences.getInstance();

      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        prefs!.setString('userId', userId);
        if (kDebugMode) {
          print(FirebaseAuth.instance.currentUser?.uid);
        }
      }

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation_Bar()),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }

      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'user-disabled') {
        errorMessage = 'The user account has been disabled.';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: primaryColor, // Change the color to red for errors
      ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10, // Adjusted for padding around icon and text
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: Text(
              "Sign-Up",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          )
        ],
        backgroundColor: backgroundColor,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(), // Adds a border
                enabledBorder: OutlineInputBorder(
                  // Defines the border style when the TextFormField is enabled but not focused
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  // Defines the border style when the TextFormField is focused
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(), // Adds a border
                enabledBorder: OutlineInputBorder(
                  // Defines the border style when the TextFormField is enabled but not focused
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  // Defines the border style when the TextFormField is focused
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 18.0),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 200,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  signIn(context);
                },
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'By continuing, you agree to our Privacy Policy and Terms & Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
