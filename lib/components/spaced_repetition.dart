import 'package:flutter/material.dart';

class SpacedRepetition extends StatelessWidget {
  const SpacedRepetition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white, // Moved inside BoxDecoration
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.2), // Shadow color with transparency
            spreadRadius: 1, // How much the shadow is spread
            blurRadius: 2, // Softness of the shadow
            // Position of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Spaced Repetition",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "How it helps you to know more?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/brain.png',
              // Set the width and height of the image
              width: 100,
              height: 80,
              // Use a box fit of cover to preserve the aspect ratio of the image
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
