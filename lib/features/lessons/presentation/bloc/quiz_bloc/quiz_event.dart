part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class QuizEventDataRequest extends QuizEvent{
  final int id;

  QuizEventDataRequest(this.id);
}

class QuizEventNextQuestion extends QuizEvent {}

class QuizEventGiveAnswer extends QuizEvent {
  final int answerPositon;
  QuizEventGiveAnswer(this.answerPositon);
  @override
  List<Object> get props => [];
}

class QuizEventShowAResult extends QuizEvent{}

class QuizEventTapWord extends QuizEvent{}

class QuizEventPlayAgain extends QuizEvent{}
class QuizEventPlayWrongAnswers extends QuizEvent{}




