
import 'package:books_demo/constants/constants.dart';
import 'package:flutter/material.dart';

class Kbutton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData? icon; // Optional icon parameter

  Kbutton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon, // Accepts icon as an optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16, // Adjusted for padding around icon and text
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) // Only add icon if it's not null
                Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Padding between icon and text
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16, // Button text size
                  color: kprimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
