import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogResult extends StatelessWidget {
  final bool isCorrect;
  final bool isQuizFinished;

  const DialogResult(
      {Key key, @required this.isCorrect, this.isQuizFinished = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.23),
      child: PhysicalModel(
        elevation: 10,
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
          //     boxShadow: [
          //   BoxShadow(
          //       color: Colors.black12,
          //       blurRadius: 5,
          //       spreadRadius: 0,
          //       offset: Offset(0, 4))
          // ],
          //
            borderRadius: BorderRadius.circular(5),
              color: Colors.white),
          height: size.height * 0.4,
          width: size.width * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              topIcon(),
              DialogMiddleText(isCorrect: isCorrect),
              isQuizFinished  ? DialogResultButton() : DialogNextButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget topIcon() {
    return isCorrect
        ? Icon(
            Icons.check,
            size: 100,
            color: kAppBlueColor,
          )
        : Container(
            decoration:
                BoxDecoration(color: Color(0xffa5a5a5), shape: BoxShape.circle),
            child: Icon(
              Icons.close,
              size: 100,
              color: Colors.white,
            ),
          );
  }
}

class DialogMiddleText extends StatelessWidget {
  const DialogMiddleText({
    Key key,
    @required this.isCorrect,
  }) : super(key: key);

  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Text(
      isCorrect ? 'Correct' : 'Wrong',
      style: TextStyle(color: kAppBlueColor, fontSize: 12),
    );
  }
}

class DialogNextButton extends StatelessWidget {
  const DialogNextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: kAppBlueColor, blurRadius: 1, offset: Offset(0, 0))
            ]),
        child: IconButton(
            icon: Icon(
              Icons.chevron_right,
              size: 20,
              color: kAppBlueColor,
            ),
            onPressed: () {
              context.read<QuizBloc>().add(QuizEventNextQuestion());
            }));
  }
}

class DialogResultButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     
     return RectangleShadowBtn(
       text: 'Result',
       action: (){
         context.read<QuizBloc>().add(QuizEventShowAResult());
       },
     );
   
  }

}
