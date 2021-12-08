import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_singleton.dart';
import 'package:quiz_school/features/lessons/domain/entity/quiz_model.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_questions.dart';
import 'package:quiz_school/injection_container.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final LessonsSingleton lessonsSingleTon;
  QuizBloc(this.lessonsSingleTon) : super(QuizStateLoading());

  List<Questions> quizAllQuestions = <Questions>[];
  List<Questions> quizStoreAllQuestions = <Questions>[];
  List<Questions> wrongAnswers = <Questions>[];
  int currentQuestionPosition;
  int lessonID;
  // bool isWrongAnserMode = false;

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is QuizEventDataRequest) {
      try {
        // isWrongAnserMode = false;
        var questions = await di.get<GetQuestions>().questions(event.id);
        lessonID = event.id;
        quizAllQuestions.addAll(questions);
        quizStoreAllQuestions.addAll(questions);
        currentQuestionPosition = 0;

        yield QuizStateShowQuestion(quizAllQuestions[currentQuestionPosition],
            currentQuestionPosition + 1);
      } catch (e) {
        yield QuizStateError(kServerErrorMsg);
      }
    } else if (event is QuizEventNextQuestion) {
      currentQuestionPosition++;
      yield QuizStateCloseDialog();
      yield QuizStateEmptyContainerLoad();
     await Future.delayed(Duration(milliseconds: 100));

      yield QuizStateShowQuestion(quizAllQuestions[currentQuestionPosition],
          currentQuestionPosition + 1);
    } else if (event is QuizEventGiveAnswer) {
      final question = quizAllQuestions[currentQuestionPosition];

      if (question.questionAns[event.answerPositon].answer == '1') {
        if (quizAllQuestions.length == (currentQuestionPosition + 1)) {
          yield QuizStateFinalAnswered(true);
        } else
          yield QuizStateRightAnswered();
      } else {
        wrongAnswers.add(question);
        if (quizAllQuestions.length == (currentQuestionPosition + 1)) {
          yield QuizStateFinalAnswered(false);
        } else
          yield QuizStateWrongAnswered();
      }
    } else if (event is QuizEventShowAResult) {
      yield QuizStateCloseDialog();
    
      yield QuizStateShowResult(calculateResultString(), wrongAnswers.isEmpty, getNextLesson());
    } else if (event is QuizEventTapWord) {
      print('quiz word request');
      yield QuizStateShowWords(lessonID);
      // yield QuizStateShowQuestion(quizAllQuestion[currentQuestionPosition],
      //     currentQuestionPosition + 1 );
    } else if (event is QuizEventPlayAgain) {
      // isWrongAnserMode = false;
      wrongAnswers.clear();
      quizAllQuestions.clear();
      quizAllQuestions.addAll(quizStoreAllQuestions);


      currentQuestionPosition = 0;
      yield QuizStateShowQuestion(quizAllQuestions[currentQuestionPosition],
          currentQuestionPosition + 1);
    } else if (event is QuizEventPlayWrongAnswers) {
      // isWrongAnserMode = true;
      quizAllQuestions.clear();
      quizAllQuestions.addAll(wrongAnswers);
      wrongAnswers.clear();
      currentQuestionPosition = 0;
      yield QuizStateShowQuestion(quizAllQuestions[currentQuestionPosition],
          currentQuestionPosition + 1);
    }
  }

  String calculateResultString() {
    // if (!isWrongAnserMode)
    //   return '${quizAllQuestions.length}問中${quizAllQuestions.length - wrongAnswers.length}問正解 !';
    // else {
    //   return '${quizStoreAllQuestions.length}問中${(quizStoreAllQuestions.length - quizAllQuestions.length) + (quizAllQuestions.length - wrongAnswers.length)}問正解 !';
    // }
      return '${quizStoreAllQuestions.length}問中${quizStoreAllQuestions.length - wrongAnswers.length}問正解 !';
  }

  Lesson getNextLesson() {
    int currentPosition = lessonsSingleTon.selectedPosition;
    if(currentPosition == (lessonsSingleTon.lessons.length - 1)){
      return null;
    }else{
      lessonsSingleTon.selectedPosition = currentPosition + 1;
      return lessonsSingleTon.lessons[lessonsSingleTon.selectedPosition];
    }
  }
}
