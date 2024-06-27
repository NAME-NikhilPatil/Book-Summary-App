import 'package:flutter/material.dart';
import 'package:books_demo/components/book_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50, // Smaller height as the search box is moved
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search Box within the Column
            Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Type title, author, or keyword",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // I want to learn about section
            Text(
              "I want to learn about",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CategoryButton(label: 'Self-Growth'),
                CategoryButton(label: 'Negotiation'),
                CategoryButton(label: 'Money & Investments'),
                CategoryButton(label: 'Love & Relationships'),
              ],
            ),
            const SizedBox(height: 20),

            // Latest summaries section
            Text(
              "Latest summaries",
              style: Theme.of(context).textTheme.headlineSmall,
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
                    author: "Simon Sinek",
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
                    author: "Simon Sinek",
                    description:
                        'Get more done in 12 weeks than others do in 12 months',
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  BookSummaryCard(
                    imagePath: 'assets/book_cover1.png',
                    author: "Simon Sinek",
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
                    author: "Simon Sinek",
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
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
