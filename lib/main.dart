import 'package:books_demo/navigationBar/navigatin_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  Gemini.init(
    apiKey: 'AIzaSyCxMTgde8BmvExDxUCbgCE2791rR0CBJAM',
    enableDebugging: true,
  );

  bool login = prefs.containsKey('userId') ? true : false;
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Summary App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigation_Bar(),
    );
  }
}
