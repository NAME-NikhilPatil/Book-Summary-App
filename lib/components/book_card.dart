import 'package:books_demo/BookDetailScreen/book_details.dart';
import 'package:flutter/material.dart';

class BookSummaryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String author;

  const BookSummaryCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the BookDetails page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              imagePath: imagePath,
              title: title,
              description: description,
              author: author,
            ), // Replace with your BookDetails widget
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: 160,
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
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
