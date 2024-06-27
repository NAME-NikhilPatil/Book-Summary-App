import 'package:books_demo/constants/constants.dart';
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
  late Future<Map<String, dynamic>?> _bookSummary;
  double _textSize = 18.0; // Updated default text size to 18
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showFunnySummaries = false;

  @override
  void initState() {
    super.initState();
    _bookSummary = FirestoreService().getBookSummary(widget.documentId);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _showTextSizeAdjuster() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Adjust Text Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: _textSize,
                    min: 12,
                    max: 24,
                    divisions: 12,
                    label: _textSize.round().toString(),
                    onChanged: (value) {
                      setModalState(() {
                        _textSize = value;
                      });
                      setState(() {
                        _textSize = value;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _fetchFunnySummaries() {
    setState(() {
      _showFunnySummaries = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: _showTextSizeAdjuster,
          ),
          IconButton(
            icon:
                const Icon(Icons.sentiment_very_satisfied), // Funny button icon
            onPressed: _fetchFunnySummaries,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _bookSummary,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No Data Found"));
          }

          List<String> headlines = _showFunnySummaries
              ? List<String>.from(snapshot.data!['fheadlines'])
              : List<String>.from(snapshot.data!['headlines']);

          int no_of_headlines = _showFunnySummaries
              ? List<String>.from(snapshot.data!['fheadlines']).length
              : List<String>.from(snapshot.data!['headlines']).length;

          List<String> summaries = _showFunnySummaries
              ? List<String>.from(snapshot.data!['fsummaries'])
              : List<String>.from(snapshot.data!['summaries']);

          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: headlines.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headlines[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _textSize + 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            summaries[index],
                            style: TextStyle(
                              fontSize: _textSize,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              LinearProgressIndicator(
                value: (_currentPage + 1) / no_of_headlines,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  primaryColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
