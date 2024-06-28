import 'package:books_demo/constants/constants.dart';
import 'package:flutter/material.dart';

class Translation_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'furnishes',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'Being present during the hum realities of life rather than furnishing them with suppressing the painful feelings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton.icon(
                          icon: Icon(
                            Icons.close,
                            color: primaryColor,
                          ),
                          label: Text(
                            'No',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            // TODO: Implement No button action
                          },
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.check,
                            color: primaryColor,
                          ),
                          label: Text(
                            'Yes',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            // TODO: Implement Yes button action
                          },
                        ),
                      ],
                    ),
                  ),
                  // TODO: Implement translation icon functionality
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
