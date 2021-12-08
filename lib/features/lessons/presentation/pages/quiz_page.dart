import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
          style: TextStyle(color: Colors.black),
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
          final content = BlocProvider.value(
              value: context.read<QuizBloc>(),
              child: DialogResult(
                isCorrect: true,
              ));
          _openCustomDialog(content, context);

          // Navigator.of(context).push(PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => BlocProvider.value(
          //         value: context.read<QuizBloc>(),
          //         child: DialogResult(
          //           isCorrect: true,
          //         )),
          //     opaque: false,
          //     barrierDismissible: false));
        } else if (state is QuizStateWrongAnswered) {
          final content = BlocProvider.value(
              value: context.read<QuizBloc>(),
              child: DialogResult(
                isCorrect: false,
              ));
          _openCustomDialog(content, context);
          // Navigator.of(context).push(PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => BlocProvider.value(
          //         value: context.read<QuizBloc>(),
          //         child: DialogResult(
          //           isCorrect: false,
          //         )),
          //     opaque: false,
          //     barrierDismissible: false));
        } else if (state is QuizStateShowResult) {
          // goto result page
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                  value: context.read<QuizBloc>(),
                  child: QuizResultPage(
                    lessonName: lesson.lessonName,
                    resultText: state.resultString,
                    isWrongButtonRemoved: state.isWrongButtonRemoved,
                    nextLesson: state.nextLesson,

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
            child: CircularProgressIndicator(color: Colors.white,),
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
        else if (state is QuizStateEmptyContainerLoad){
          return Container();
        }
        else{
          return Container();
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

void _openCustomDialog(Widget content, BuildContext context) {
  showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: content,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {}
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
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(childAnimationBuilder: (widget) {
                  return SlideAnimation(child: FadeInAnimation(child: widget), horizontalOffset: 50.0,);
                }, duration: Duration(milliseconds: 500), children:  [
                  Text('$kQuiz $number', style: TextStyle(color: Colors.white)),
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
                ]) ,
              ),
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
      padding: EdgeInsets.symmetric( vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
                border: Border.all(width: 1, color: kBorderColor)),
            child: Text(
              question.questionTitle,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
