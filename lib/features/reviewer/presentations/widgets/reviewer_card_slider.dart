import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card_reviewer/features/reviewer/applications/reviewer_cubit.dart';
import 'package:flip_card_reviewer/features/reviewer/presentations/widgets/fliping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewerCardSlider extends StatelessWidget {
  const ReviewerCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<ReviewerCubit, ReviewerState>(
      builder: (context, state) {
        final list = context.read<ReviewerCubit>().questionsAndAnswers;
        return CarouselSlider(
          items: [
            ...list.map((e) => FlippingCard(
                  height: height,
                  width: width * 0.8,
                  question: e.question,
                  answer: e.answer,
                )),
          ],
          options: CarouselOptions(
            height: height * 0.7,
            viewportFraction: 0.9,
          ),
        );
      },
    );
  }
}
