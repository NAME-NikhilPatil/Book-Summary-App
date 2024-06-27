import 'package:books_demo/firebase/firestore_service.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({
    Key? key,
    required this.title,
    required this.documentId,
  }) : super(key: key);

  final String title;
  final String documentId;

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  late Future<String?> _detailFuture;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _detailFuture = _firestoreService.getBookDetail(widget.documentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<String?>(
          future: _detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Summary',
                    //   style: Theme.of(context).textTheme.headlineMedium,
                    // ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.data!,
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('No detail found.'),
              );
            }
          },
        ),
      ),
    );
  }
}
