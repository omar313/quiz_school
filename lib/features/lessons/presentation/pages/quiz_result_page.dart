import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({Key key,@required this.lessonName, @required this.resultText, this.isWrongButtonRemoved}) : super(key: key);
  final String lessonName; 
  final String resultText;
  final bool isWrongButtonRemoved;
  

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
        body: ResultBody(resultText: resultText,isWrongButtonRemoved: isWrongButtonRemoved,),
      ),
    );
  }
}

class ResultBody extends StatelessWidget {
  final String resultText;
  final bool isWrongButtonRemoved;
  const ResultBody({Key key, this.resultText, this.isWrongButtonRemoved}) : super(key: key);

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
        ResultButton(text: kStartFromBegining, action: (){},),
        ResultButton(text: 'Lesson 2^', action: (){},),
        ResultButton(text: 'Top^', action: (){},),
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