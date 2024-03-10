class QuestionAndAnswerModel {
  final String question;
  final String answer;

  QuestionAndAnswerModel({required this.question, required this.answer});

  factory QuestionAndAnswerModel.fromJson(Map<String, dynamic> json) =>
      QuestionAndAnswerModel(
        question: json['question'] ?? "",
        answer: json['answer'] ?? "",
      );
}
