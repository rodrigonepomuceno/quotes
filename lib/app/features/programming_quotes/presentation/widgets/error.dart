import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  const ErrorLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.blue[700],
          ),
          const SizedBox(height: 20),
          Text(
            'Sorry, an error occurred while fetching the data.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
