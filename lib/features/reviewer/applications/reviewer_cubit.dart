import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flip_card_reviewer/features/reviewer/data/models/question_and_answer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'reviewer_state.dart';

class ReviewerCubit extends Cubit<ReviewerState> {
  ReviewerCubit() : super(ReviewerInitial()) {
    debugPrint("ReviewerCubit.ReviewerCubit: ");
    _initialize();
  }

  Future<void> _initialize() async{
    try {
      final jsonString = await rootBundle.loadString("assets/data/dummies/question_and_answers.json");
      final jsonDecoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final decoded = jsonDecoded["data"] as List;

      questionsAndAnswers = decoded
              .map((data) =>
              QuestionAndAnswerModel.fromJson(data as Map<String, dynamic>))
              .toList();
      emit(ReviewerLoaded());
    } catch (e) {
      debugPrint("ReviewerCubit._initialize: $e");
    }
  }

  List<QuestionAndAnswerModel> questionsAndAnswers = [];

  void addQuestionAndAnswer(
      {required String question, required String answer}) {
    final bool questionExisted = questionsAndAnswers.any(
        (element) => element.question.toLowerCase() == question.toLowerCase());
    if (questionExisted) {
      emit(ReviewerAddFailed(Exception("Question is already existed")));
    }

    questionsAndAnswers
        .add(QuestionAndAnswerModel(question: question, answer: answer));
  }

  void removeQuestionAndAnswer({required String question}) {
    final index = questionsAndAnswers.indexWhere(
        (element) => element.question.toLowerCase() == question.toLowerCase());

    if (0 > index) {
      emit(ReviewerRemoveFailed(Exception("Question is not listed")));
    }
    questionsAndAnswers.removeAt(index);
  }
}
