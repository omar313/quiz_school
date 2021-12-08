part of 'quiz_bloc.dart';

abstract class QuizState  {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizStateLoading extends QuizState {}
class QuizStateError extends QuizState {
  final String error;

  QuizStateError(this.error);
  
   @override
  List<Object> get props => [];

}

class QuizStateShowQuestion extends QuizState {
  final Questions question;
  final int position;

  QuizStateShowQuestion(this.question, this.position);
  @override
  List<Object> get props => [this.question, this.position];
}
class QuizStateEmptyContainerLoad extends QuizState {}
class QuizStateRightAnswered extends QuizState {}

class QuizStateCloseDialog extends QuizState {}

class QuizStateWrongAnswered extends QuizState {}

class QuizStateFinalAnswered extends QuizState {
  final bool isRight;

  QuizStateFinalAnswered(this.isRight);

  @override
  List<Object> get props => [this.isRight];
}



class QuizStateShowResult extends QuizState {
  // final List<Questions> wrongAnswers;
  final String resultString;
   final bool isWrongButtonRemoved;
   final Lesson nextLesson;


  QuizStateShowResult(this.resultString, this.isWrongButtonRemoved , this.nextLesson);

  @override
  List<Object> get props => [this.resultString, this.isWrongButtonRemoved];
}

class QuizStateShowWords extends QuizState {
  final int id;

  QuizStateShowWords(this.id);
}