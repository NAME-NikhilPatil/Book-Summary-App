import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Have The Most Successful Morning'),
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'What Yourself A Mindful Morning',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Many of us often feel that mornings slip away without accomplishing much. Laura Vanderkam acknowledges this state of helplessness, where we have our sights on the clock but tackle less essential activities. Eventually, we sacrifice important, perhaps life-changing, endeavors.',
              style: TextStyle(
                fontSize: 18.0,
                height: 1.6,
              ),
            ),
            // Add more Text widgets for each paragraph
          ],
        ),
      ),
    );
  }
}
