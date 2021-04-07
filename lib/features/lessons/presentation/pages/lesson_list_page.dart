import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/lessons/presentation/widget/body.dart';

class LessonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(kLessons),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.home), onPressed: () {  },),
      ),
      body: Body(),
    );
  }
}
