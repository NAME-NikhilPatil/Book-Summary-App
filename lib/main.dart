import 'package:books_demo/HomeScreen/homescreen.dart';
import 'package:books_demo/SplashScreen/splash_sceen.dart';
import 'package:books_demo/book_bot/conversation_provider.dart';
import 'package:books_demo/firebase/firebase_options.dart';
import 'package:books_demo/navigationBar/navigatin_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();

  bool login = prefs.containsKey('userId') ? true : false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConversationProvider(),
      child: MyApp(),
    ),
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
      home: HomeScreen(),
    );
  }
}
