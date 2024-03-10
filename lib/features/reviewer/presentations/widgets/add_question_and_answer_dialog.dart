import 'package:flutter/material.dart';

class AddQuestionAndAnswerDialog extends StatefulWidget {
  const AddQuestionAndAnswerDialog({super.key});

  @override
  State<AddQuestionAndAnswerDialog> createState() => _AddQuestionAndAnswerDialogState();
}

class _AddQuestionAndAnswerDialogState extends State<AddQuestionAndAnswerDialog> {
  TextEditingController questionTextController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    questionTextController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog( child: Wrap(
      children: [
        // TODO : Implement Code
      ],
    ));
  }
}
