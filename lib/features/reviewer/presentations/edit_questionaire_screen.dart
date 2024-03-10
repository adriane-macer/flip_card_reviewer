import 'package:flip_card_reviewer/features/reviewer/applications/reviewer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditQuestionnaireScreen extends StatelessWidget {
  const EditQuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Questionnaire"),
        ),
        body: BlocConsumer<ReviewerCubit, ReviewerState>(
          listener: (context, state) {
            if (state is ReviewerAddFailed) {}
          },
          builder: (context, state) {
            final qna = context.watch<ReviewerCubit>().questionsAndAnswers;
            if (qna.isEmpty) {
              return const Center(
                child: Text("No question and answer"),
              );
            }
            return ListView.builder(
                itemCount: qna.length,
                itemBuilder: (context, index) {
                  final questionAndAnswer = qna.elementAt(index);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text("Question: ${questionAndAnswer.question}"),
                        subtitle: Text("Answer: ${questionAndAnswer.answer}"),
                      ),
                    ),
                  );
                });
          },
        ),

    floatingActionButton: FloatingActionButton(onPressed: () {
      // TODO  : Implement Code
    },),);
  }
}
