import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String message;
  final bool isFlipped;

  const ReviewCard({super.key, required this.message, required this.isFlipped});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Transform(
      alignment: Alignment.center,
      transform: !isFlipped ? Matrix4.rotationY(0) : Matrix4.rotationY(3.14),
      child: Container(
        decoration: BoxDecoration(
          color: isFlipped ? Colors.blue : primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
