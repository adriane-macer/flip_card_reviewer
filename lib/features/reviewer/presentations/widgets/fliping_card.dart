import 'dart:math';

import 'package:flip_card_reviewer/features/reviewer/presentations/widgets/review_card.dart';
import 'package:flutter/material.dart';

class FlippingCard extends StatefulWidget {
  final String question;
  final String answer;
  final double height;
  final double width;

  const FlippingCard(
      {super.key,
      required this.question,
      required this.answer,
      required this.width,
      required this.height});

  @override
  State<FlippingCard> createState() => _FlippingCardState();
}

class _FlippingCardState extends State<FlippingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isQuestion = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        if (_animation.value >= 0.5) {
          _isQuestion = false;
        } else {
          _isQuestion = true;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_controller.status != AnimationStatus.forward) {
      if (_isQuestion) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: Center(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Transform(
            transform: Matrix4.rotationY(_animation.value * pi),
            alignment: Alignment.center,
            child: _isQuestion
                ? ReviewCard(
                    message: widget.question,
                    isFlipped: false,
                  )
                : ReviewCard(message: widget.answer, isFlipped: true),
          ),
        ),
      ),
    );
  }
}
