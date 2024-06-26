import 'package:books_demo/components/button.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:books_demo/loginScreen/login_screen.dart';
import 'package:books_demo/loginScreen/sign_in_sceen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/splash1.png',
      'title': 'Books in 15 minutes',
      'description':
          'We read the best books, highlight key ideas and insights, and create summaries for you'
    },
    {
      'image': 'assets/splash2.png',
      'title': 'Read and listen anywhere',
      'description':
          'Download content to read, listen, or do both at the same time offline'
    },
    {
      'image': 'assets/splash3.png',
      'title': 'Personal growth plan',
      'description':
          'Set your learning goals and accept a personalized challenge'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Background color matching the image
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(
                    image: _pages[index]['image']!,
                    title: _pages[index]['title']!,
                    description: _pages[index]['description']!,
                  );
                },
              ),
            ),
            Kbutton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(color: primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(_pages.length, (index) {
              return _buildProgressDot(index == _currentIndex, index + 1);
            }),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32, // Adjusted font size
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 9,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 18, // Adjusted font size
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressDot(bool isActive, int pageNumber) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$pageNumber', // Static numbers: 1, 2, 3
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
