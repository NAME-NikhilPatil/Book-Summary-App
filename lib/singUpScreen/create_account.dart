import 'package:books_demo/constants/constants.dart';
import 'package:books_demo/loginScreen/login_screen.dart';
import 'package:books_demo/navigationBar/navigatin_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final databaseReference = FirebaseFirestore.instance;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> signup(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigation_Bar()),
        );
      });

      User? user;
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      user = result.user;

      await databaseReference.collection("User").doc(user!.uid).set({
        'email': emailController.text,
        'password': passwordController.text,
        'username': usernameController.text,
      });
    } catch (e) {
      print(e);
      String errorMessage = 'An error occurred';
      if (e is FirebaseAuthException) {
        errorMessage = e.message!;
      }
      _showErrorSnackBar(context, errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> _navigateToLoginScreen(BuildContext context) async {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text("Now enter your Email and Password and Login:)"),
  //     backgroundColor: primaryColor,
  //   ));

  //   // Navigate to LoginScreen after showing the Snackbar

  // }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      backgroundColor: primaryColor,
    ));
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Create an account"),
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
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: Text(
              "Login",
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
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: usernameController,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  )),
              child: TextButton(
                onPressed: () async {
                  await signup(context);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                'By continuing, you agree to our Privacy Policy and Terms & Conditions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
