import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/lessons/presentation/widget/body.dart';

class LessonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(kLessons, style: TextStyle(color: Colors.black),),

        leading: IconButton(icon: Image.asset('assets/images/quiz_app_logo.jpg'),  onPressed: () {
          Navigator.of(context).pop();
        },),
      ),
      body: Body(),
    );
  }
}
