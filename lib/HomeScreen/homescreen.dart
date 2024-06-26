import 'package:books_demo/components/book_card.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Good Morning, Nikhil',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Free Daily Summary Card
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Free daily summary',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Handle daily summary
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: primaryColor,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Get it now'),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/book_cover1.png',
                      width: 100,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              // Categories Section
              const Text(
                'Categories you\'re interested in:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryCard(
                      icon: Icons.auto_awesome,
                      label: 'Productivity',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CategoryCard(
                      icon: Icons.leaderboard,
                      label: 'Leadership',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CategoryCard(
                      icon: Icons.people,
                      label: 'communication',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CategoryCard(
                      icon: Icons.favorite,
                      label: 'Love',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Today for You Section
              const Text(
                'Today for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookSummaryCard(
                      imagePath: 'assets/book_cover1.png',
                      title:
                          'What the Most Successful People Do Before Breakfast',
                      description:
                          'A short guide to making over your mornings and life',
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    BookSummaryCard(
                      imagePath: 'assets/book_cover2.png',
                      title: 'The 12 Week Year',
                      description:
                          'Get more done in 12 weeks than others do in 12 months',
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    BookSummaryCard(
                      imagePath: 'assets/book_cover1.png',
                      title:
                          'What the Most Successful People Do Before Breakfast',
                      description:
                          'A short guide to making over your mornings and life',
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    BookSummaryCard(
                      imagePath: 'assets/book_cover2.png',
                      title: 'The 12 Week Year',
                      description:
                          'Get more done in 12 weeks than others do in 12 months',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 36,
                color: primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

