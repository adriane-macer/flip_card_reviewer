import 'package:flip_card_reviewer/features/reviewer/presentations/widgets/reviewer_card_slider.dart';
import 'package:flutter/material.dart';

class ReviewerScreen extends StatelessWidget {
  const ReviewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviewer"),
      ),body: const ReviewerCardSlider(),
    );
  }
}
