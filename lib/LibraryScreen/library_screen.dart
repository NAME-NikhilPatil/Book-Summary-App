import 'package:books_demo/Translation%20Screen/translate_screen.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/book_card.dart';
import '../components/spaced_repetition.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Summaries'),
            Tab(text: 'Repetition'),
            Tab(text: 'Highlights'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildTabContent('Continue', 'Saved for later'),
          buildTabContent1(),
          buildTabContent('Continue', 'Saved for later'),
        ],
      ),
    );
  }

  Widget buildTabContent(String? sectionTitle1, String? sectionTitle2) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        buildSectionHeader(sectionTitle1!),
        const SizedBox(height: 10),
        buildHorizontalBookList(),
        const SizedBox(height: 20),
        buildSectionHeader(sectionTitle2!),
        const SizedBox(height: 10),
        buildHorizontalBookList(),
      ],
    );
  }

  Widget buildTabContent1() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(height: 10),
        const SpacedRepetition(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Translation_Screen(),
                ));
          },
          // you can change the text as you like
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),

            backgroundColor:
                primaryColor, // this is the background color of the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10), // this is the corner radius of the button
            ),
          ),
          child: const Text(
            'Repeat',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        buildHorizontalBookList(),
        const SizedBox(height: 20),
        // buildSectionHeader(sectionTitle2!),
      ],
    );
  }

  Widget buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {
            // Add 'See all' functionality here
          },
          child: const Text('See all'),
        ),
      ],
    );
  }

  Widget buildHorizontalBookList() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookSummaryCard(
            title: 'The 80/20 CEO',
            author: "Simon Sinek",
            documentId: 'EakVkTRO0zLD1L6GyfsQ',
            imagePath: 'assets/book_cover1.png',
            description: 'Bill Canady',
          ),
          SizedBox(width: 12),
          BookSummaryCard(
            title: 'The Art of Seduction',
            author: "Simon Sinek",
            documentId: 'EakVkTRO0zLD1L6GyfsQ',
            imagePath: 'assets/book_cover2.png',
            description: 'Robert Greene, BA',
          ),
          SizedBox(width: 12),
          BookSummaryCard(
            title: 'Not Nice',
            author: "Simon Sinek",
            documentId: 'EakVkTRO0zLD1L6GyfsQ',
            imagePath: 'assets/book_cover1.png',
            description: 'Dr. Aziz Gazipura',
          ),
          SizedBox(width: 12),
          BookSummaryCard(
            title: 'Atomic Habits',
            author: "Simon Sinek",
            documentId: 'EakVkTRO0zLD1L6GyfsQ',
            imagePath: 'assets/book_cover2.png',
            description: 'James Clear',
          ),
          SizedBox(width: 12),
          BookSummaryCard(
            title: 'How to Make People Like You',
            author: "Simon Sinek",
            documentId: 'EakVkTRO0zLD1L6GyfsQ',
            imagePath: 'assets/book_cover1.png',
            description: 'Nicholas Boothman',
          ),
        ],
      ),
    );
  }
}
