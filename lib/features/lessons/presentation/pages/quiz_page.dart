import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/quiz_model.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/pages/quiz_result_page.dart';
import 'package:quiz_school/features/lessons/presentation/widget/quiz/dialog_result.dart';
import 'package:quiz_school/features/lessons/presentation/widget/quiz/words_bottom_sheet.dart';

class QuizPage extends StatelessWidget {
  final Lesson lesson;

  const QuizPage({
    Key key,
    this.lesson,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${lesson.lessonName}\n$kQuiz',
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(lesson: lesson,),
    );
  }
}

class Body extends StatelessWidget {
final Lesson lesson;

  const Body({Key key, @required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizStateRightAnswered) {
          print('Right Answered');
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => BlocProvider.value(
                  value: context.read<QuizBloc>(),
                  child: DialogResult(
                    isCorrect: true,
                  )),
              opaque: false,
              barrierDismissible: false));
        } else if (state is QuizStateWrongAnswered) {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => BlocProvider.value(
                  value: context.read<QuizBloc>(),
                  child: DialogResult(
                    isCorrect: false,
                  )),
              opaque: false,
              barrierDismissible: false));
        } else if (state is QuizStateShowResult) {
          // goto result page
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                  value: context.read<QuizBloc>(),
                  child: QuizResultPage(
                    lessonName: lesson.lessonName,
                    resultText: state.resultString,
                    isWrongButtonRemoved: state.isWrongButtonRemoved,
                  ))));
        } else if (state is QuizStateFinalAnswered) {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => BlocProvider.value(
                  value: context.read<QuizBloc>(),
                  child: DialogResult(
                    isCorrect: state.isRight,
                    isQuizFinished: true,
                  )),
              opaque: false,
              barrierDismissible: false));
        } else if (state is QuizStateCloseDialog) {
          Navigator.pop(context);
        } else if (state is QuizStateShowWords) {
          showBottomSheet(
              context: context,
              builder: (context) {
                return WordsBottomSheet();
              });
        }
      },
      builder: (context, state) {
        if (state is QuizStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuizStateError) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is QuizStateShowQuestion) {
          return QuizQuestionAnswer(
            question: state.question,
            number: state.position.toString(),
          );
        }
      },
      buildWhen: (previous, current) {
        if (current is QuizStateRightAnswered ||
            current is QuizStateWrongAnswered ||
            current is QuizStateFinalAnswered ||
            current is QuizStateShowResult ||
            current is QuizStateCloseDialog ||
            current is QuizStateShowWords) {
          return false;
        }
        return true;
      },
    );
  }
}

class QuizQuestionAnswer extends StatelessWidget {
  final Questions question;
  final String number;

  const QuizQuestionAnswer({Key key, this.question, this.number})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$kQuiz $number'),
                QuestionBox(question: question),
                AnswersListView(question: question),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RectangleShadowBtn(
                        text: kWord,
                        action: () {
                          context.read<QuizBloc>().add(QuizEventTapWord());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnswersListView extends StatelessWidget {
  const AnswersListView({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Questions question;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RectangleShadowBtn(
            width: double.infinity,
            text: question.questionAns[position].answerText,
            fontSize: 18,
            action: () {
              context.read<QuizBloc>().add(QuizEventGiveAnswer(position));
            },
          ),
        );
      },
      itemCount: question.questionAns.length,
    );
  }
}

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Questions question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: kBorderColor)),
            child: (Text(
              question.questionTitle,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            )),
          )
        ],
      ),
    );
  }
}
