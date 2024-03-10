import 'package:flip_card_reviewer/features/reviewer/applications/reviewer_cubit.dart';
import 'package:flip_card_reviewer/features/reviewer/presentations/edit_questionaire_screen.dart';
import 'package:flip_card_reviewer/features/reviewer/presentations/reviewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flip Card Reviewer"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Icon(Icons.menu_book_rounded, color: Theme
              .of(context)
              .primaryColor, size: 80,),
          const SizedBox(height: 24,),
          SizedBox(
              width: width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>
                            BlocProvider.value(
                              value:  context.read<ReviewerCubit>(),
                              child: const EditQuestionnaireScreen(),
                            )));
                  }, child: const Text("Edit Reviewer"))),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
              width: width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>
                            BlocProvider.value(
                              value:  context.read<ReviewerCubit>(),
                              child: const ReviewerScreen(),
                            )));
                  }, child: const Text("Review"))),
        ],
      ),
    );
  }
}
