part of 'reviewer_cubit.dart';

abstract class ReviewerState extends Equatable {
  const ReviewerState();
}

class ReviewerInitial extends ReviewerState {
  @override
  List<Object> get props => [];
}

class ReviewerLoaded extends ReviewerState {

  @override
  List<Object> get props => [];
}

class ReviewerAddSuccess extends ReviewerState {
  final String question;

  const ReviewerAddSuccess(this.question);
  @override
  List<Object> get props => [];
}

class ReviewerAddFailed extends ReviewerState {
  final Exception exception;

  const ReviewerAddFailed(this.exception);
  @override
  List<Object> get props => [exception];
}

class ReviewerRemoveFailed extends ReviewerState {
  final Exception exception;

  const ReviewerRemoveFailed(this.exception);
  @override
  List<Object> get props => [exception];
}

class ReviewerRemoveSuccess extends ReviewerState {
  final String question;

  const ReviewerRemoveSuccess(this.question);
  @override
  List<Object> get props => [question];
}
