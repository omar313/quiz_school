import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';

import 'lesson_list_detail.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({Key key,@required this.lessonName, @required this.resultText, this.isWrongButtonRemoved, this.nextLesson}) : super(key: key);
  final String lessonName; 
  final String resultText;
  final bool isWrongButtonRemoved;
  final Lesson nextLesson;
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Container(),
          title: Text('$lessonName\n$kQuiz', textAlign: TextAlign.center,),
        ),
        body: ResultBody(resultText: resultText,isWrongButtonRemoved: isWrongButtonRemoved,nextLesson: nextLesson,),
      ),
    );
  }
}

class ResultBody extends StatelessWidget {
  final String resultText;
  final bool isWrongButtonRemoved;
  final Lesson nextLesson;
  const ResultBody({Key key, this.resultText, this.isWrongButtonRemoved, this.nextLesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Text(resultText, style: TextStyle(fontSize: 20),)),

            ],
          ),
        ),
        ResultButton(text: kPlayAgain, action: (){
          context.read<QuizBloc>().add(QuizEventPlayAgain());
          Navigator.of(context).pop();
        },),
       isWrongButtonRemoved ? Container() :  ResultButton(text: kPlayOnlyWrongAnswer, action: (){
          context.read<QuizBloc>().add(QuizEventPlayWrongAnswers());
          Navigator.of(context).pop();
        },),
        ResultButton(text: kStartFromBegining, action: (){
          var count = 0;
          Navigator.of(context).popUntil((route) => count++ == 2);
        },),
         if(nextLesson !=null)
         ResultButton(text: nextLesson.lessonName, action: (){
           Navigator.of(context).pop();
           Navigator.of(context).pop();
           Navigator.of(context).pop();
           Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => LessonListDetail(
                 lesson: nextLesson,
               )));
         },),
        ResultButton(text: 'Top^', action: (){
            var count = 0;
          Navigator.of(context).popUntil((route) => count++ == 3);
        },),
      ]),
    );
  }

}

class ResultButton extends StatelessWidget {
  const ResultButton({
    Key key, @required this.text, @required this.action,
  }) : super(key: key);

  final String text;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RectangleShadowBtn(text: text,width: 200,action: action,fontSize: 20,  ),
    );
  }
}